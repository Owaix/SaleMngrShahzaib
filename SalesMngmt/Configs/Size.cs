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
    public partial class Size : MetroFramework.Forms.MetroForm
    {
        SaleManagerEntities db = null;
        List<Lib.Entity.Sizes> list = null;
        int compID = 0;



        public Size(int company)
        {
            InitializeComponent();
          //  InitializeComponent();
            db = new SaleManagerEntities();

            compID = company;   
        }


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
            list = db.Sizes.AsNoTracking().Where(x=>x.CompanyID== compID).ToList();
            sizeBindingSource.DataSource = list;
        }

        private void lblAdd_Click(object sender, EventArgs e)
        {
            sizeBindingSource.AddNew();
            pnlMain.Show();
            GetDocCode();
            txtcat.Focus();
            label3.Text = "ADD";
        }

        private void lblEdit_Click(object sender, EventArgs e)
        {
            Lib.Entity.Sizes obj = (Lib.Entity.Sizes)sizeBindingSource.Current;
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
            Lib.Entity.Sizes us = (Lib.Entity.Sizes)sizeBindingSource.Current;
            if (us.SizeID == 0)
            {
                sizeBindingSource.RemoveCurrent();
                list = db.Sizes.AsNoTracking().Where(x=>x.CompanyID==compID).ToList();
                sizeBindingSource.DataSource = list;
            }
            else
            {

                sizeBindingSource.Clear();
                var listcancel = db.Sizes.AsNoTracking().Where(x => x.CompanyID == compID).ToList();
                sizeBindingSource.DataSource = listcancel;
            }
        }

        //public void alluser(string username)
        //{
        //    lblUserName.Text = username;
        //}
        private void btnSave_Click(object sender, EventArgs e)
        {
            if (txtcat.Text == "")
            { MessageBox.Show("Please Provide Size", "", MessageBoxButtons.OK, MessageBoxIcon.Error); }
            else
            {
                Lib.Entity.Sizes obj = (Lib.Entity.Sizes)sizeBindingSource.Current;

                var Currentobj = db.Sizes.ToList().Find(x => x.SizeName == txtcat.Text.Trim() && x.CompanyID == compID);// list.Find(x => x.Name == txtcat.Text.Trim());
                if (obj.SizeID == 0)
                {
                    if (Currentobj != null)
                    {
                        MessageBox.Show("Size Exists", "Duplicate", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        return;
                    }
                }
                else
                {
                    bool isCodeExist = db.Sizes.Any(record =>
                                         record.SizeName == obj.SizeName &&
                                         record.SizeID != obj.SizeID
                                         && record.CompanyID==compID);
                    if (isCodeExist)
                    {
                        MessageBox.Show("Size Exists", "Duplicate", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        return;
                    }
                }

                obj.SizeName = txtcat.Text.Trim();
                obj.IsDeleted = chkIsActive.Checked;
                obj.CompanyID = compID;
                if (obj.SizeID == 0)
                {
                    db.Sizes.Add(obj);
                }
                else
                {
                    var result = db.Sizes.SingleOrDefault(b => b.SizeID == obj.SizeID && b.CompanyID==compID);
                    if (result != null)
                    {
                        result.SizeName = txtcat.Text.Trim();
                        result.IsDeleted = chkIsActive.Checked;
                    }
                }
                db.SaveChanges();
                pnlMain.Hide();

                list = db.Sizes.AsNoTracking().Where(x=>x.CompanyID==compID).ToList();
                sizeBindingSource.DataSource = list;
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
                    CategorysDataGridView.DataSource = list.FindAll(x => x.SizeName.ToLower().Contains(toolStripTextBoxFind.Text.ToLower().Trim()));
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
}


















      
    

