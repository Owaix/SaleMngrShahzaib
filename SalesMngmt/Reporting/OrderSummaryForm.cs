﻿using Lib;
using Lib.Entity;
using Lib.Model;
using Microsoft.Reporting.WinForms;
using SalesMngmt.Utility;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Windows.Forms;

namespace LabExpressDesktop.Reporting
{
    public partial class OrderSummaryForm : Form
    {
        #region -- Global variables start --
        bool isNight { get; set; } = false;
        SaleManagerEntities db = null;
        #endregion -- Global variable end --
        string userID = "0";
        List<OrderReportModel> list = null;
        AspNetUsers User;

        public OrderSummaryForm(string UsrID, AspNetUsers aspNetUser)
        {
            InitializeComponent();
            db = new SaleManagerEntities();
            userID = UsrID;
            User = aspNetUser;
        }

        private IEnumerable<Dict> GetPaymentType()
        {
            List<Dict> dict = new List<Dict>();
            dict.Add(new Dict { key = 0, Value = "All" });
            dict.Add(new Dict { key = 1, Value = "Cash" });
            dict.Add(new Dict { key = 3, Value = "Card" });
            dict.Add(new Dict { key = 2, Value = "Void" });
            return dict;
        }
        private void BookingSummary_Load(object sender, EventArgs e)
        {
            fromDate.Value = DateTime.Today;
            endDate.Value = DateTime.Today.AddDays(1).AddSeconds(-1);
            PopulateUsers();
            getuserTime();
            FillCombo<Dict>(comboBox1, GetPaymentType(), "Value", "Key");
            //    this.rptBookingSummary.RefreshReport();
        }

        public void FillCombo<T>(ComboBox comboBox, IEnumerable<T> obj, String Name, String ID, int selected = 0)
        {
            if (obj.Count() > 0)
            {
                comboBox.DataSource = obj;
                comboBox.DisplayMember = Name; // Column Name
                comboBox.ValueMember = ID;  // Column Name
                comboBox.SelectedIndex = selected;
            }
        }
        private void btnRun_Click(object sender, EventArgs e)
        {
            //isNight = false;

            //Users u = (Users)ddlUsers.SelectedItem;
            //if (u != null && u.isNight) { isNight = true; }

            DateTime dtStart = DateTime.Now;
            DateTime dtEnd = DateTime.Now;
            //if (isNight && DateTime.Now.Hour < 10)
            //{
            //    dtStart = DateTime.Today.AddDays(-1).AddHours(20);
            //    dtEnd = DateTime.Now;
            //}
            //else if (isNight && DateTime.Now.Hour > 20)
            //{
            //    dtStart = DateTime.Today.AddHours(20);
            //    dtEnd = DateTime.Now;
            //}
            //else
            //{
            dtStart = fromDate.Value;
            dtEnd = endDate.Value;
            //}

            rptBookingSummary.LocalReport.DataSources.Clear();
            list = Lib.Reporting.Reports.BookingSummary(dtStart, dtEnd, ddlUsers.Text, comboBox1.SelectedValue.ToString(), User.AccessFailedCount);

            List<CompanyModel> list2 = new List<CompanyModel>();
            list2.Add(new CompanyModel { CompanyTitle = new Companies().GetCompanyID(User.AccessFailedCount).CompanyTitle });
            //List<Lib.Model.OrderReportModel> obj2 = Lib.Reporting.Reports.BookingSummary_Summary(dtStart, dtEnd, ddlUsers.Text);
            //List<Lib.Model.OrderReportModel> obj3 = Lib.Reporting.Reports.BookingSummary_CategoryandLabWiseTest(dtStart, dtEnd, ddlUsers.Text);

            //
            //List<Com.LT.LabExpress.Reporting.BookingSummary> objreport = Com.LT.LabExpress.Reporting.Reports.BookingSummary_UserTotalAmount(fromDate.Value, endDate.Value);
            rptBookingSummary.LocalReport.DataSources.Add(new ReportDataSource("Ds", list));
            rptBookingSummary.LocalReport.DataSources.Add(new ReportDataSource("Ds2", list2));
            //rptBookingSummary.LocalReport.DataSources.Add(new ReportDataSource("Ds3", obj3));
            this.rptBookingSummary.RefreshReport();
            button1.Enabled = true;
        }


        #region -- Helper Method Start --
        public void getRole(string roleID) { lblRoleID.Text = roleID; }

        public void passUser(String userID)
        {
            lbluserID.Text = userID;
        }

        private void PopulateUsers()
        {
            var ul = db.AspNetUsers.ToList();
            if (ul.Count > 0)
            {
                AspNetUsers objusers = new AspNetUsers();
                objusers.Id = "0";
                objusers.UserName = "all";
                ul.Add(objusers);
                ddlUsers.DisplayMember = "username";
                ddlUsers.ValueMember = "userid";
                ddlUsers.DataSource = ul.OrderByDescending(x => x.UserName == "all").ThenBy(x => x.UserName).ToList();
            }
            else { ddlUsers.DataSource = null; }
        }

        public void getuserTime()
        {
        }
        #endregion -- Helper Method End --

        private void OrderSummaryForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Dispose();
            //Main config = new Main(0, User);
            //config.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            list.ForEach(x => { x.item = x.InvoiceNo; x.userName = ddlUsers.Text; });
            Silent silent = new Silent();
            ReportViewer reportViewer1 = new ReportViewer();
            //Printer.setDef(ConfigurationManager.AppSettings["Thermal"].ToString());
            silent.Run(reportViewer1, list, "SalesMngmt.Reporting.Definition.Summary.rdlc");
        }
    }
}
