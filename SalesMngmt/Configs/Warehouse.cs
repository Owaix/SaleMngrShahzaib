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
    public partial class Warehouse : MetroFramework.Forms.MetroForm
    {

        SaleManagerEntities db = null;
        List<tbl_Warehouse> list = null;

        int CompID = 0;
        public Warehouse(int company)
        {
            InitializeComponent();
            db = new SaleManagerEntities();
            CompID = company;
        }

        private void Company_Load(object sender, EventArgs e)
        {
            //PartyType type = new PartyType();
            //DataAccess access = new DataAccess();
            //type.PType_ID = 1;
            //var con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
            //con.Open();
            //SqlTransaction trans = con.BeginTransaction();
            //var objPartyType = access.Get<PartyType>("Sp_partyType_Select", type, con, trans);

            pnlMain.Hide();
            list = db.tbl_Warehouse.AsNoTracking().Where(x=>x.CompanyID== CompID).ToList();
            tblWarehouseBindingSource.DataSource = list;
        }

        private void lblAdd_Click(object sender, EventArgs e)
        {
            tblWarehouseBindingSource.AddNew();
            pnlMain.Show();
            GetDocCode();
            txtWarehouseName.Focus();
            label3.Text = "ADD";
        }

        private void lblEdit_Click(object sender, EventArgs e)
        {
            tbl_Warehouse obj = (tbl_Warehouse)tblWarehouseBindingSource.Current;
            pnlMain.Show();
            txtWarehouseName.Focus();
            label3.Text = "EDIT";
        }

        #region -- Global variables start --

        string docCode;

        #endregion -- Global variable end --


        private void btnCancel_Click(object sender, EventArgs e)
        {
            pnlMain.Hide();
            tbl_Warehouse us = (tbl_Warehouse)tblWarehouseBindingSource.Current;
            if (us.WID == 0)
            {
                tblWarehouseBindingSource.RemoveCurrent();
            }
            else
            {
         
                tblWarehouseBindingSource.Clear();
                var listcancel = db.tbl_Warehouse.AsNoTracking().Where(x=>x.CompanyID== CompID).ToList();
                tblWarehouseBindingSource.DataSource = listcancel;
            }
        }

        //public void alluser(string username)
        //{
        //    lblUserName.Text = username;
        //}
        private void btnSave_Click(object sender, EventArgs e)
        {
            if (txtWarehouseName.Text == "")
            { MessageBox.Show("Please Provide warehouse Name", "", MessageBoxButtons.OK, MessageBoxIcon.Error); }
            else
            {
                tbl_Warehouse obj = (tbl_Warehouse)tblWarehouseBindingSource.Current;

                var Currentobj = db.tbl_Warehouse.ToList().Find(x => x.Warehouse == txtWarehouseName.Text.Trim() && x.CompanyID== CompID);
                if (obj.WID == 0)
                {
                    if (Currentobj != null)
                    {
                        MessageBox.Show("Warehouse Name Already Exists", "Duplicate", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        return;
                    }
                }
                else
                {
                    bool isCodeExist = list.Any(record =>
                                         record.Warehouse == obj.Warehouse &&
                                         record.WID != obj.WID
                                         && record.CompanyID== CompID);
                    if (isCodeExist)
                    {
                        MessageBox.Show("Warehouse Name Already Exists", "Duplicate", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        return;
                    }
                }

                obj.Warehouse = txtWarehouseName.Text.Trim();
                obj.WSht = txtShort.Text.Trim();
                obj.CompanyID = CompID;
                obj.Email = txtMail.Text;
                obj.Address = txtAddress.Text;
                obj.Telephone = txtTel.Text;
                obj.isDelete= chkIsActive.Checked;
                //  obj.isDelete = chkIsActive.Checked;
                if (obj.WID == 0)
                {
                    db.tbl_Warehouse.Add(obj);
                }
                else
                {
                    var result = db.tbl_Warehouse.SingleOrDefault(b => b.WID == obj.WID && b.CompanyID== CompID);
                    if (result != null)
                    {
                        result.Warehouse = txtWarehouseName.Text.Trim();
                        result.isDelete = chkIsActive.Checked;
                        result.Email = txtMail.Text;
                        result.Address = txtAddress.Text;
                        result.Telephone = txtTel.Text;
                    }
                }
                db.SaveChanges();
                pnlMain.Hide();
                var listcancel = db.tbl_Warehouse.AsNoTracking().Where(x => x.CompanyID == CompID).ToList();
                tblWarehouseBindingSource.DataSource = listcancel;
            }
        }
        private void PartyTypeDataGridView_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            CompanyDataGridView.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
        }

        #region -- Helper Method Start --
        public void GetDocCode()
        {
            //PartyTypeList obj = new PartyTypeList(new PartyType { }.Select());
            //docCode = "DOC-" + (obj.Count + 1);
        }

        #endregion -- Helper Method End --


        private void toolStripTextBoxFind_Leave(object sender, EventArgs e)
        {
            try
            {
                if (toolStripTextBoxFind.Text.Trim().Length == 0) { CompanyDataGridView.DataSource = list; }
                else
                {
                  //  tblWarehouseBindingSource.DataSource = list.FindAll(x => x.Warehouse.ToLower().Contains(toolStripTextBoxFind.Text.ToLower().Trim()));
                }
            }
            catch (Exception)
            {
                throw;
            }
        }


















        //public Warehouse()
        //{
        //    InitializeComponent();
        //}
    }
}
