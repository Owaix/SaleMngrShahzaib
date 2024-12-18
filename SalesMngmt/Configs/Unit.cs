﻿using Lib;
using Lib.Entity;
using Lib.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;

namespace SalesMngmt.Configs
{
    public partial class Unit : MetroFramework.Forms.MetroForm
    {
        SaleManagerEntities db = null;
        List<I_Unit> list = null;
        int compID = 0;

        public Unit(int cmpID)
        {
            InitializeComponent();
            db = new SaleManagerEntities();
            compID = cmpID;
        }

        private void Unit_Load(object sender, EventArgs e)
        {
            pnlMain.Hide();
            list = db.I_Unit.AsNoTracking().Where(x => x.CompanyID == compID).ToList();
            itemBindingSource.DataSource = list;
        }

        private void lblAdd_Click(object sender, EventArgs e)
        {
            itemBindingSource.AddNew();
            pnlMain.Show();
            GetDocCode();
            txtUnit.Focus();
            label3.Text = "ADD";
        }

        private void lblEdit_Click(object sender, EventArgs e)
        {
            I_Unit obj = (I_Unit)itemBindingSource.Current;
            pnlMain.Show();
            txtUnit.Focus();
            label3.Text = "EDIT";
        }

        #region -- Global variables start --

        string docCode;

        #endregion -- Global variable end --


        private void btnCancel_Click(object sender, EventArgs e)
        {
            pnlMain.Hide();
            I_Unit us = (I_Unit)itemBindingSource.Current;
            if (us.unit_id == 0)
            {
                itemBindingSource.RemoveCurrent();
            }
            else
            {

                itemBindingSource.Clear();
                var listcancel = db.I_Unit.AsNoTracking().Where(x => x.CompanyID == compID).ToList();
                itemBindingSource.DataSource = listcancel;
            }
        }

        //public void alluser(string username)
        //{
        //    lblUserName.Text = username;
        //}
        private void btnSave_Click(object sender, EventArgs e)
        {
            if (txtUnit.Text == "")
            { MessageBox.Show("Please Provide Unit Type", "", MessageBoxButtons.OK, MessageBoxIcon.Error); }
            else
            {
                I_Unit obj = (I_Unit)itemBindingSource.Current;

                var Currentobj = db.I_Unit.ToList().Find(x => x.IUnit == txtUnit.Text.Trim() && x.CompanyID== compID);
                if (obj.unit_id == 0)
                {
                    if (Currentobj != null)
                    {
                        MessageBox.Show("Unit Name Already Exists", "Duplicate", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        return;
                    }
                }
                else
                {
                    bool isCodeExist = list.Any(record =>
                                         record.IUnit == obj.IUnit &&
                                         record.unit_id != obj.unit_id &&
                                         record.CompanyID== compID);
                    if (isCodeExist)
                    {
                        MessageBox.Show("Unit Name Already Exists", "Duplicate", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        return;
                    }
                }

                obj.IUnit = txtUnit.Text.Trim();
                obj.active = chkIsActive.Checked;
                obj.crtBy = "";
                obj.crtDate = DateTime.Now;
                obj.CompanyID = compID;
                if (obj.unit_id == 0)
                {
                    db.I_Unit.Add(obj);
                }
                else
                {
                    var result = db.I_Unit.SingleOrDefault(b => b.unit_id == obj.unit_id);
                    if (result != null)
                    {
                        result.IUnit = txtUnit.Text.Trim();
                        result.active = chkIsActive.Checked;
                        obj.modBy = "";
                        obj.modDate = DateTime.Now.ToString();
                    }
                }
                db.SaveChanges();
                pnlMain.Hide();
            }
        }
        private void UnitDataGridView_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            UnitDataGridView.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
        }

        #region -- Helper Method Start --
        public void GetDocCode()
        {
            //UnitList obj = new UnitList(new Unit { }.Select());
            //docCode = "DOC-" + (obj.Count + 1);
        }

        private void toolStripTextBoxFind_Leave(object sender, EventArgs e)
        {
            try
            {
                if (toolStripTextBoxFind.Text.Trim().Length == 0) { UnitDataGridView.DataSource = list; }
                else
                {
                    UnitDataGridView.DataSource = list.FindAll(x => x.IUnit.ToLower().Contains(toolStripTextBoxFind.Text.ToLower().Trim()));
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        //
        #endregion -- Helper Method End --

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
