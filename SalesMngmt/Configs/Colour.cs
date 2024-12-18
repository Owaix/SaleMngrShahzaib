﻿using Lib.Entity;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SalesMngmt.Configs
{
    public partial class Colour :  MetroFramework.Forms.MetroForm
    {
        SaleManagerEntities db = null;
        List<Lib.Entity.Colors> list = null;
        int compID = 0;

        public Colour(int company)
        {
            InitializeComponent();
            db = new SaleManagerEntities();
          compID = company;
        }

        //public Categories(int cmpID)
        //{
        //    InitializeComponent();
        //    db = new SaleManagerEntities();
        //    compID = cmpID;
        //}

        private void Category_Load(object sender, EventArgs e)
        {
            //cat type = new cat();
            //DataAccess access = new DataAccess();
            //type.PType_ID = 1;
            //var con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
            //con.Open();
            //SqlTransaction trans = con.BeginTransaction();
            //var objcat = access.Get<cat>("Sp_cat_Select", type, con, trans);

            pnlMain.Hide();
            list = db.Colors.AsNoTracking().Where(x=>x.CompanyID== compID).ToList();
            colorBindingSource.DataSource = list;
        }

        private void lblAdd_Click(object sender, EventArgs e)
        {
            colorBindingSource.AddNew();
            pnlMain.Show();
            GetDocCode();
            txtcat.Focus();
            label3.Text = "ADD";
        }

        private void lblEdit_Click(object sender, EventArgs e)
        {
            Lib.Entity.Colors obj = (Lib.Entity.Colors)colorBindingSource.Current;
            pnlMain.Show();
            txtcat.Focus();
            label3.Text = "EDIT";
        }

        #region -- Global variables start --

        string docCode;

        #endregion -- Global variable end --


        private void btnCancel_Click(object sender, EventArgs e)
        {
            pnlMain.Hide();
            Lib.Entity.Colors us = (Lib.Entity.Colors)colorBindingSource.Current;
            if (us.ColorID == 0)
            {
                colorBindingSource.RemoveCurrent();
                list = db.Colors.AsNoTracking().Where(x=>x.CompanyID== compID).ToList();
                colorBindingSource.DataSource = list;
            }
            else
            {
             
                colorBindingSource.Clear();
                var listcancel = db.Colors.AsNoTracking().Where(x => x.CompanyID == compID).ToList();
                colorBindingSource.DataSource = listcancel;
            }
        }

        //public void alluser(string username)
        //{
        //    lblUserName.Text = username;
        //}
        private void btnSave_Click(object sender, EventArgs e)
        {
            if (txtcat.Text == "")
            { MessageBox.Show("Please Provide Colour", "", MessageBoxButtons.OK, MessageBoxIcon.Error); }
            else
            {
                Lib.Entity.Colors obj = (Lib.Entity.Colors)colorBindingSource.Current;

                var Currentobj = db.Colors.ToList().Find(x => x.Name == txtcat.Text.Trim()  && x.CompanyID==compID);// list.Find(x => x.Name == txtcat.Text.Trim());
                if (obj.ColorID == 0)
                {
                    if (Currentobj != null)
                    {
                        MessageBox.Show("Colour Exists", "Duplicate", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        return;
                    }
                }
                else
                {
                    bool isCodeExist = list.Any(record =>
                                         record.Name == obj.Name &&
                                         record.ColorID != obj.ColorID
                                         && record.CompanyID==compID);
                    if (isCodeExist)
                    {
                        MessageBox.Show("Colour Exists", "Duplicate", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        return;
                    }
                }

                obj.Name = txtcat.Text.Trim();
                obj.IsDeleted = chkIsActive.Checked;
                obj.CompanyID = compID;
                if (obj.ColorID == 0)
                {
                    db.Colors.Add(obj);
                }
                else
                {
                    var result = db.Colors.SingleOrDefault(b => b.ColorID == obj.ColorID && b.CompanyID==compID);
                    if (result != null)
                    {
                        result.Name = txtcat.Text.Trim();
                        result.IsDeleted = chkIsActive.Checked;
                    }
                }
            
                db.SaveChanges();
                pnlMain.Hide();

                list = db.Colors.AsNoTracking().Where(x=>x.CompanyID==compID).ToList();
                colorBindingSource.DataSource = list;
            }
        }
        private void catDataGridView_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            CategorysDataGridView.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
        }

        #region -- Helper Method Start --
        public void GetDocCode()
        {
            //catList obj = new catList(new cat { }.Select());
            //docCode = "DOC-" + (obj.Count + 1);
        }

        private void toolStripTextBoxFind_Leave(object sender, EventArgs e)
        {
            try
            {
                if (toolStripTextBoxFind.Text.Trim().Length == 0) { CategorysDataGridView.DataSource = list; }
                else
                {
                    CategorysDataGridView.DataSource = list.FindAll(x => x.Name.ToLower().Contains(toolStripTextBoxFind.Text.ToLower().Trim()));
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        //
        #endregion -- Helper Method End --

        private void CategorysDataGridView_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
    //    public Colour()
    //    {
    //        InitializeComponent();
    //    }
    //}
}
