﻿using Lib.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;

namespace SalesMngmt.Configs
{
    public partial class Users : MetroFramework.Forms.MetroForm
    {
        SaleManagerEntities db = null;
        List<AspNetUsers> list = null;
        int compID = 0;

        public Users(int cmpID)
        {
            InitializeComponent();
            db = new SaleManagerEntities();
            compID = cmpID;
        }

        private void Catgory_Load(object sender, EventArgs e)
        {
            pnlMain.Hide();
            List<Roles> roles = new List<Roles>();
            roles.Add(new Roles { RoleID = "1", RoleTitle = "Admin" });
            roles.Add(new Roles { RoleID = "2", RoleTitle = "Booker" });
            FillCombo(cmbRole, roles, "RoleTitle", "RoleID", 0);

            list = (from a in db.AspNetUsers.ToList()
                    join b in roles on a.PhoneNumber equals b.RoleID
                    where a.AccessFailedCount == compID
                    select new AspNetUsers
                    {
                        UserName = a.UserName,
                        SecurityStamp = b.RoleTitle,
                        AccessFailedCount = a.AccessFailedCount,
                        PasswordHash = a.PasswordHash,
                        PhoneNumber = a.PhoneNumber
                    }).ToList();

            itemBindingSource.DataSource = list;
        }

        private void lblAdd_Click(object sender, EventArgs e)
        {
            itemBindingSource.AddNew();
            pnlMain.Show();
            GetDocCode();
            txtUser.Focus();
            label3.Text = "ADD";
        }

        private void lblEdit_Click(object sender, EventArgs e)
        {
            AspNetUsers obj = (AspNetUsers)itemBindingSource.Current;
            pnlMain.Show();
            txtUser.Focus();
            label3.Text = "EDIT";
        }


        #region -- Global variables start --

        string docCode;

        #endregion -- Global variable end --


        private void btnCancel_Click(object sender, EventArgs e)
        {
            pnlMain.Hide();
            AspNetUsers us = (AspNetUsers)itemBindingSource.Current;
            if (us.Id == "0")
            {
                itemBindingSource.RemoveCurrent();
            }
        }

        //public void alluser(string username)
        //{
        //    lblUserName.Text = username;
        //}
        private void btnSave_Click(object sender, EventArgs e)
        {
            if (txtUser.Text == "")
            { MessageBox.Show("Please Provide User Name", "", MessageBoxButtons.OK, MessageBoxIcon.Error); }
            else
            {
                AspNetUsers obj = (AspNetUsers)itemBindingSource.Current;

                var Currentobj = db.AspNetUsers.Where(x => x.UserName == txtUser.Text.Trim()).FirstOrDefault();
                if (obj.Id == "0")
                {
                    if (Currentobj != null)
                    {
                        MessageBox.Show("UserName Already Exists", "Duplicate", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        return;
                    }
                }

                obj.UserName = txtUser.Text.Trim();
                obj.PasswordHash = txtPass.Text.Trim();
                obj.PhoneNumber = cmbRole.SelectedValue.ToString();
                obj.PhoneNumberConfirmed = chkIsActive.Checked;
                obj.AccessFailedCount = compID;
                obj.Email = txtUser.Text.Trim() + "@gmail.com";
                obj.EmailConfirmed = true;
                obj.SecurityStamp = "a";
                obj.TwoFactorEnabled = true;
                obj.LockoutEnabled = true;
                if (obj.Id == "0" || obj.Id == null)
                {
                    var ID = db.AspNetUsers.OrderByDescending(q => q.Id).FirstOrDefault();
                    obj.Id = (Convert.ToInt32(ID.Id) + 1).ToString();
                    db.AspNetUsers.Add(obj);
                }
                else
                {
                    var result = db.AspNetUsers.SingleOrDefault(b => b.Id == obj.Id);
                    if (result != null)
                    {
                        result.UserName = txtUser.Text.Trim();
                        result.PasswordHash = txtPass.Text.Trim();
                        result.PhoneNumber = cmbRole.SelectedValue.ToString();
                        result.PhoneNumberConfirmed = chkIsActive.Checked;
                    }
                }
                db.SaveChanges();
                pnlMain.Hide();
            }
        }
        private void CategoryDataGridView_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            CategoryDataGridView.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
        }
        #region -- Helper Method Start --
        public void GetDocCode()
        {
            //CategoryList obj = new CategoryList(new Category { }.Select());
            //docCode = "DOC-" + (obj.Count + 1);
        }

        private void toolStripTextBoxFind_Leave(object sender, EventArgs e)
        {
            try
            {
                if (toolStripTextBoxFind.Text.Trim().Length == 0) { CategoryDataGridView.DataSource = list; }
                else
                {
                    List<AspNetUsers> filteredList = new List<AspNetUsers>();
                    foreach (var item in list)
                    {
                        if (item.UserName.Contains(toolStripTextBoxFind.Text))
                        {
                            filteredList.Add(item);
                        }
                    }
                    CategoryDataGridView.DataSource = filteredList;
                }
            }
            catch (Exception)
            {
                throw;
            }
        }


        public void FillCombo(ComboBox comboBox, object obj, String Name, String ID, int selected = 1)
        {
            try
            {
                comboBox.DataSource = obj;
                comboBox.DisplayMember = Name; // Column Name
                comboBox.ValueMember = ID;  // Column Name
                comboBox.SelectedValue = selected;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        //
        #endregion -- Helper Method End --
    }

    public class Roles
    {
        public string RoleID { get; set; }
        public string RoleTitle { get; set; }
    }
}
