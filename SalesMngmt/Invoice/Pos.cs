﻿using LabExpressDesktop.Reporting;
using Lib;
using Lib.Entity;
using Lib.Model;
using Lib.Reporting;
using Lib.Utilities;
using MetroFramework.Controls;
using Microsoft.Reporting.WinForms;
using SalesMngmt.Reporting;
using SalesMngmt.Utility;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Windows.Forms;

namespace SalesMngmt.Invoice
{
    public partial class Pos : MetroFramework.Forms.MetroForm
    {
        SaleManagerEntities db = null;
        bool takeAway = false;
        bool HomeDelivery = false;
        bool Express = false;
        SqlConnection con = null;
        SqlTransaction trans = null;
        bool DineIn = true;
        String UsrID = "0";
        String CurrentBlock = "";
        AspNetUsers UserObj = null;
        CompaniesModel CompaniesModel = null;
        int compy = 0;

        public Pos(AspNetUsers _usr, int company)
        {
            InitializeComponent();
            db = new SaleManagerEntities();
            //user = db.AspNetUsers.Where(x => x.Id == UsrID).FirstOrDefault();
            label35.Text = _usr.Email;
            UserObj = _usr;
            UsrID = _usr.Id;
            compy = company;
        }

        private void Pos_Load(object sender, EventArgs e)
        {
            pnlTab2.Visible = false;
            generateCategory();
            pnlTotal.Hide();
            panel3.Hide();
            panel7.Hide();
            panel8.Hide();
            var list = new List<COA_M>();
            var waiter = db.tbl_Employee.AsNoTracking().Where(x => x.companyID == compy).ToList();
            var Account = db.COA_M.Where(x => x.CAC_Code == 1 || x.CAC_Code == 3 || x.CAC_Code == 9).ToList();

            var warehouse = db.tbl_Warehouse.AsNoTracking().Where(x => x.CompanyID == compy && x.isDelete == false).ToList();

            FillCombo(cmbxWarehouse, warehouse, "Warehouse", "WID", 0);
            FillCombo(cmbxWarehouse1, warehouse, "Warehouse", "WID", 0);


            FillCombo<COA_M>(cmbxCus, Account, "CATitle", "CAC_Code", 0);
            list.Add(new COA_M { CAC_Code = 1, CATitle = "%" });
            list.Add(new COA_M { CAC_Code = 2, CATitle = "Rs" });
            FillCombo<COA_M>(cmbxDis1, list, "CATitle", "CAC_Code");
            FillCombo<COA_M>(cmbxGst1, list, "CATitle", "CAC_Code");
            FillCombo<tbl_Employee>(cmbxWaiter, waiter, "EmployeName", "ID");
            //FillCombo<Customer>(cmbxCus, Customers, "CusName", "CID", -1);
            FillCombo<Dict>(ddlpizzaSize, GetAllSize(), "Value", "Key", 0);
            FillCombo<Dict>(ddlpizzaFlavout, GetAllFlavor(), "Value", "Key");
            FillCombo<COA_D>(comboBox1, GetPaymentType(), "AC_Title", "AC_Code");
            FillCombo<COA_D>(cmbxPayment, GetPaymentType(), "AC_Title", "AC_Code");
            var vendor = db.COA_D.Where(x => x.CAC_Code == 1 && x.CompanyID == compy).ToList();
            FillCombo(cmbxvendor, vendor, "AC_Title", "AC_Code", 0);
            BindOrders();

            if (lblTblID.Text == "0")
            {
                btnChangeTable.Enabled = false;
            }
            else
            {
                btnChangeTable.Enabled = true;
            }
            CompaniesModel = new Companies().GetCompanyID(UserObj.AccessFailedCount);
            label33.Text = CompaniesModel == null ? "" : CompaniesModel.CompanyTitle;
        }

        private IEnumerable<Dict> Getsize()
        {
            List<Dict> dict = new List<Dict>();
            dict.Add(new Dict { key = 1, Value = "Half" });
            dict.Add(new Dict { key = 2, Value = "Full" });
            return dict;
        }

        private IEnumerable<COA_D> GetPaymentType()
        {
            List<COA_D> cash = new List<COA_D>();

            cash.Add(new COA_D { AC_Code = 0, AC_Title = "--Credit--" });
            cash.AddRange(db.COA_D.Where(x => x.CAC_Code == 1 && x.CompanyID == compy).ToList());
            return cash;
        }

        private IEnumerable<Dict> GetAllFlavor()
        {
            List<Dict> dict = new List<Dict>();
            dict.Add(new Dict { key = 1, Value = "Tikka" });
            dict.Add(new Dict { key = 2, Value = "Fajita" });
            dict.Add(new Dict { key = 3, Value = "Cheese Lover" });
            dict.Add(new Dict { key = 4, Value = "Peproni" });
            return dict;
        }

        private List<Dict> GetAllSize()
        {
            List<Dict> dict = new List<Dict>();
            dict.Add(new Dict { key = 0, Value = "" });
            dict.Add(new Dict { key = 1, Value = "Small" });
            dict.Add(new Dict { key = 2, Value = "Medium" });
            dict.Add(new Dict { key = 3, Value = "Large" });
            dict.Add(new Dict { key = 4, Value = "Jumbo" });
            return dict;
        }

        private void generateCategory()
        {
            var categoryList = db.Items_Cat.Where(x => x.CompanyID == UserObj.AccessFailedCount && x.isDeleted==false).ToList();
            int locY = 9; // 73 
            int CategoryLen = categoryList.Count;
            int Height = 67;
            int R = 20;
            int G = 40;
            int B = 100;

            for (int i = 0; i < CategoryLen; i++)
            {
                //categoryList[i].img = String.IsNullOrEmpty(categoryList[i].img) ? "cartoon-roast-chicken_119631-190.jpg" : categoryList[i].img;
                //string customPath = Path.GetDirectoryName(Application.ExecutablePath) + @"\Img\" + categoryList[i].img;
                categoryList[i].img = String.IsNullOrEmpty(categoryList[i].img) ? "cartoon-roast-chicken_119631-190.jpg" : categoryList[i].img;
                string customPath = Path.GetDirectoryName(Application.ExecutablePath) + @"\Img\" + categoryList[i].img;
                if (!File.Exists(customPath))
                {
                    customPath = Path.GetDirectoryName(Application.ExecutablePath) + @"\Img\cartoon-roast-chicken_119631-190.jpg";
                }
                var btnItems = new MetroButton();
                var btnCat = new MetroButton();
                //btnCat.ActiveControl = null;
                //btnCat.BackColor = System.Drawing.Color.DeepSkyBlue;
                //btnCat.ForeColor = System.Drawing.Color.Black;
                //btnCat.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(R)))), ((int)(((byte)(G)))), ((int)(((byte)(B)))));
                btnCat.BackgroundImage = Image.FromFile(customPath);
                btnCat.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
                btnCat.Location = new System.Drawing.Point(9, locY);
                btnCat.Name = categoryList[i].CatID.ToString();
                btnCat.Size = new System.Drawing.Size(122, Height);
                btnCat.TabIndex = 8;
                btnCat.Text = "";
                btnCat.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
                //btnCat.TileTextFontSize = MetroFramework.MetroTileTextSize.Tall;
                //btnCat.TileTextFontWeight = MetroFramework.MetroTileTextWeight.Bold;
                btnCat.UseCustomBackColor = true;
                btnCat.UseSelectable = true;
                btnCat.Click += new EventHandler(MetroTile_Click);
                panel5.Controls.Add(btnCat);
                R += 20;
                G += 25;
                B += 30;

                var lblTitle = new Label();
                lblTitle.AutoSize = true;
                lblTitle.Font = new System.Drawing.Font("Microsoft YaHei", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
                lblTitle.Location = new System.Drawing.Point(9, locY + 69);
                lblTitle.Name = "label23";
                lblTitle.Size = new System.Drawing.Size(129, 22);
                lblTitle.TabIndex = 27;
                lblTitle.Text = categoryList[i].Cat;
                panel5.Controls.Add(lblTitle);
                locY += 93; //73

            }
        }

        internal void EditPOS(string v, String f, DataGridView grid, Label lblBa, int val = 0)
        {
            try
            {
                if (v == "" || v == "0")
                {
                    return;
                }
                int selectedInd = grid.CurrentCell.RowIndex;
                if (selectedInd > -1)
                {
                    if (f == "qty")
                    {
                        grid.Rows[selectedInd].Cells[4].Value = v;
                    }
                    else if (f == "Disc")
                    {
                        if (val == 1)
                        {
                            var Amt = Convert.ToDecimal(grid.Rows[selectedInd].Cells[4].Value) * Convert.ToDecimal(grid.Rows[selectedInd].Cells[3].Value);
                            grid.Rows[selectedInd].Cells[5].Value = CalculateDis(1, Amt.ToString(), v);
                        }
                        else
                        {
                            grid.Rows[selectedInd].Cells[5].Value = v;
                        }
                    }
                    else
                    {
                        grid.Rows[selectedInd].Cells[3].Value = v;
                    }
                    grid.Rows[selectedInd].Cells[6].Value = (Convert.ToDecimal(grid.Rows[selectedInd].Cells[4].Value) * Convert.ToDecimal(grid.Rows[selectedInd].Cells[3].Value) - Convert.ToDecimal(grid.Rows[selectedInd].Cells[5].Value));
                    LoadBal(grid, lblBa);
                }
            }
            catch (InvalidOperationException ex)
            {
                //var exceptions = ExceptionExtensions.ToMessageAndCompleteStacktrace(ex);
                //Lib.Entity.Excption Excepti = new Lib.Entity.Excption();
                //Excepti.ExcptionName = exceptions;
                //db.Excptions.Add(Excepti);
                //db.SaveChanges();
                MessageBox.Show("Unable to remove selected row at this time");
            }
        }
        int CatId = 0;
        protected void MetroTile_Click(object sender, EventArgs e)
        {
            MetroButton button = sender as MetroButton;
            CatId = Convert.ToInt32(button.Name);
            var itemList = db.Items.Where(x => x.SCatID == CatId && x.isDeleted == false && x.CompanyID == UserObj.AccessFailedCount).ToList();
            GenerateItems(itemList, true);
        }

        private void GenerateItems(List<Lib.Entity.Items> itemList, bool bind)
        {
            // System.Drawing.Point(164, 82);
            // System.Drawing.Point(274, 82);
            // System.Drawing.Point(164, 167);
            panel5.Controls.OfType<MetroButton>().ToList().ForEach(x =>
            {
                if (x.TabIndex != 8)
                {
                    x.Dispose();
                }
            });

            panel5.Controls.OfType<Label>().ToList().ForEach(x =>
            {
                if (x.TabIndex == 14)
                {
                    x.Dispose();
                }
            });

            if (bind)
            {
                FillCombo<Lib.Entity.Items>(cmbxItems, itemList, "IName", "IID");
            }
            int locX = 164;
            int locY = 40;
            int itemLen = itemList.Count;
            int R = 200;
            int G = 100;
            int B = 10;


            double firstLoop = (double)itemLen / 4;
            double y = firstLoop - Math.Truncate(firstLoop);
            if (y > 0.0001)
            {
                firstLoop += Convert.ToInt32(y);
            }
            firstLoop = firstLoop == 0 ? 1 : firstLoop;
            int len = 0;
            for (int i = 0; i < firstLoop; i++)
            {
                locX = 164;
                for (int j = 0; j < 4; j++)
                {
                    try
                    {
                        if (len == itemLen)
                        {
                            break;
                        }
                        //this.panel7.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("panel7.BackgroundImage")));
                        //this.panel7.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
                        //string customPath = @"E:\ada\cartoon-roast-chicken_119631-190.jpg";
                        //if (itemList[len].BarCode_ID != "")
                        //{
                        itemList[len].BarCode_ID = String.IsNullOrEmpty(itemList[len].BarCode_ID) ? "32313.jpg" : itemList[len].BarCode_ID;
                        string customPath = Path.GetDirectoryName(Application.ExecutablePath) + @"\Img\" + itemList[len].BarCode_ID;
                        var btnItems = new MetroButton();
                        //if (!File.Exists(customPath))
                        //{
                        //    btnItems.BackgroundImage = Image.FromFile(Path.GetDirectoryName(Application.ExecutablePath) + @"\Img\" + "pizza-burger.jpg");
                        //}
                        //else
                        //{
                        //    btnItems.BackgroundImage = Image.FromFile(customPath);
                        //}

                        if (string.IsNullOrEmpty(itemList[len].Img))
                        {
                            btnItems.BackgroundImage = Image.FromFile(Path.GetDirectoryName(Application.ExecutablePath) + @"\Img\" + "pizza-burger.jpg");
                        }
                        else
                        {
                            btnItems.BackgroundImage = Utillityfunctions.LoadImage(itemList[len].Img);
                        }

                        btnItems.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
                        //btnCat.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(R)))), ((int)(((byte)(G)))), ((int)(((byte)(B)))));
                        btnItems.Location = new System.Drawing.Point(locX, locY);
                        btnItems.Name = itemList[len].IName + "~" + itemList[len].IID.ToString() + "~" + itemList[len].RetailPrice;
                        btnItems.Size = new System.Drawing.Size(91, 64);
                        btnItems.TabIndex = 33;
                        btnItems.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
                        btnItems.UseCustomBackColor = true;
                        btnItems.UseSelectable = true;
                        btnItems.Click += new EventHandler(MetroTile_Clickitem);
                        panel5.Controls.Add(btnItems);
                        G += 60;
                        B += 60;

                        var lblTitle = new Label();
                        lblTitle.AutoSize = true;
                        lblTitle.Font = new System.Drawing.Font("Microsoft YaHei", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
                        lblTitle.Location = new System.Drawing.Point(locX + 7, locY + 65);
                        lblTitle.Name = "label23";
                        lblTitle.Size = new System.Drawing.Size(129, 22);
                        lblTitle.TabIndex = 14;
                        String Item = String.Empty;
                        var ItemArr = itemList[len].IName.Split(' ');
                        for (int x = 0; x < ItemArr.Length; x++)
                        {
                            if (x == 2)
                            {
                                Item += Environment.NewLine + ItemArr[x];
                            }
                            else
                            {
                                Item += ItemArr[x] + " ";
                            }
                        }
                        lblTitle.Text = Item + Environment.NewLine + "Rs : " + itemList[len].SalesPrice;
                        panel5.Controls.Add(lblTitle);
                        locX += 130;

                        len += 1;
                    }
                    catch (Exception ex)
                    {
                        //var exceptions = ExceptionExtensions.ToMessageAndCompleteStacktrace(ex);
                        //Lib.Entity.Excption Excepti = new Lib.Entity.Excption();
                        //Excepti.ExcptionName = exceptions;
                        //db.Excptions.Add(Excepti);
                        //db.SaveChanges();
                        MessageBox.Show(ex.Message);
                        //    break;
                    }
                }
                locY += 120;
            }
        }
        String btnName = String.Empty;
        protected void MetroTile_Clickitem(object sender, EventArgs e)
        {
            if (DineIn == true && lblTblID.Text == "0")
            {
                var result = MessageBox.Show("Table Is Not Selected In Dine In", "Choose Table First", MessageBoxButtons.YesNo, MessageBoxIcon.Information);
                if (result == DialogResult.Yes)
                {
                    TablsList table = new TablsList(compy, "new", lblTblID.Text, UsrID, this, UserObj, cmbxWaiter, cmbxWaiter.SelectedValue.ToString());
                    this.Hide();
                    table.Show();
                    return;
                }
                else
                {
                    return;
                }
            }

            MetroButton button = sender as MetroButton;
            var btn = button.Name.Split('~');
            var text = btn[0];
            var name = btn[1];
            Decimal fullPlate = Convert.ToDecimal(btn[2]);
            if (text.Contains("Pizza"))
            {
                btnName = name;
                ShowDialogs();
                return;
            }
            //else if (fullPlate != 0)
            //{
            //    btnName = name + "~" + fullPlate.ToString();
            //    panel3.Show();
            //    return;
            //}
            int IID = Convert.ToInt32(name);
            AddSubQty(IID, 1, "inc", "", "0");

        }

        private void ShowDialogs()
        {
            ddlpizzaSize.SelectedValue = 1;
            ddlpizzaFlavout.SelectedValue = 0;
            panel7.Show();
        }
        private void AddSubQty(int IID, int inc, string Flag, String Pizza, double? price)
        {
            bool isAdd = true;
            var item = db.Items.Where(x => x.IID == IID).FirstOrDefault();
            if (item != null)
            {
                price = price == 0 ? item.SalesPrice : price;
                decimal Discount = 0;
                foreach (DataGridViewRow row in gridItems.Rows)
                {
                    //if (row.Cells[1].Value != null && Pizza == "")
                    //{
                    var itemID = Convert.ToInt32(row.Cells[1].Value.DefaultZero());
                    var SP = Convert.ToInt32(row.Cells[3].Value.DefaultZero());
                    if (IID == itemID && price == SP)
                    {
                        if (row.Cells[4].Value.ToString() == "1" && Flag == "dec")
                        {
                            gridItems.Rows.RemoveAt(row.Index);
                        }
                        else
                        {
                            row.Cells[0].Value = item.SCatID;
                            row.Cells[1].Value = item.IID;
                            row.Cells[2].Value = item.IName;
                            row.Cells[3].Value = price;
                            row.Cells[4].Value = Convert.ToDouble(row.Cells[4].Value) + inc;
                            Discount = Convert.ToDecimal(CalculateDis(1, (Convert.ToDecimal(price) * Convert.ToDecimal(row.Cells[4].Value)).ToString(), item.DisP.ToString().Replace(".00", ""))) + item.DisR ?? 0;
                            row.Cells[5].Value = Discount;
                            row.Cells[6].Value = (Convert.ToDecimal(price) * Convert.ToDecimal(row.Cells[4].Value)) - Discount;
                            row.Cells[7].Value = Pizza;
                        }
                        isAdd = false;
                        //}
                    }
                }
                if (isAdd == true)
                {
                    Discount = Convert.ToDecimal(CalculateDis(1, price.ToString(), item.DisP.ToString().Replace(".00", ""))) + item.DisR ?? 0;
                    this.gridItems.Rows.Add(item.SCatID, item.IID, item.IName, price, 1, Discount, Convert.ToDecimal(price) - Discount, Pizza);
                }
                LoadBal();
            }
        }
        private void AddSubQty(int IID, int inc, string Flag, String Pizza, String Size)
        {
            bool isAdd = true;
            var item = db.Items.Where(x => x.IID == IID).FirstOrDefault();
            var SalesPrice = item.SalesPrice;
            if (Size != "0")
            {
                if (Size == "1")
                {
                    SalesPrice = item.SalesPrice;
                }
                else if (Size == "2")
                {
                    SalesPrice = Convert.ToDouble(item.RetailPOne);
                }
                else if (Size == "3")
                {
                    SalesPrice = Convert.ToDouble(item.RetailPTwo);
                }
                else if (Size == "4")
                {
                    SalesPrice = Convert.ToDouble(item.RetailPThree);
                }
            }
            if (item != null)
            {
                decimal Discount = 0;
                foreach (DataGridViewRow row in gridItems.Rows)
                {
                    if (row.Cells[1].Value != null && Pizza == "")
                    {
                        var itemID = Convert.ToInt32(row.Cells[1].Value.ToString() == "" ? "0" : row.Cells[1].Value);
                        if (IID == itemID)
                        {
                            if (row.Cells[4].Value.ToString() == "1" && Flag == "dec")
                            {
                                gridItems.Rows.RemoveAt(row.Index);
                            }
                            else
                            {
                                row.Cells[0].Value = item.SCatID;
                                row.Cells[1].Value = item.IID;
                                row.Cells[2].Value = item.IName;
                                row.Cells[3].Value = SalesPrice;
                                row.Cells[4].Value = Convert.ToDouble(row.Cells[4].Value) + inc;
                                Discount = Convert.ToDecimal(CalculateDis(1, (Convert.ToDecimal(row.Cells[3].Value) * Convert.ToDecimal(row.Cells[4].Value)).ToString(), item.DisP.ToString().Replace(".00", ""))) + item.DisR ?? 0;
                                row.Cells[5].Value = Discount;
                                row.Cells[6].Value = (Convert.ToDecimal(row.Cells[3].Value) * Convert.ToDecimal(row.Cells[4].Value)) - Discount;
                                row.Cells[7].Value = Pizza;
                            }
                            isAdd = false;
                        }
                    }
                }
                if (isAdd == true)
                {
                    Discount = Convert.ToDecimal(CalculateDis(1, SalesPrice.ToString(), item.DisP.ToString().Replace(".00", ""))) + item.DisR ?? 0;
                    this.gridItems.Rows.Add(item.SCatID, item.IID, item.IName, SalesPrice, 1, Discount, Convert.ToDecimal(SalesPrice) - Discount, Pizza);
                }
                LoadBal();
            }
        }

        private void LoadBal()
        {
            Decimal Amount = 0;
            foreach (DataGridViewRow row in gridItems.Rows)
            {
                var SP = Convert.ToDecimal(row.Cells[3].Value);
                var Qty = Convert.ToDecimal(row.Cells[4].Value);
                var Disc = Convert.ToDecimal(row.Cells[5].Value);
                Amount += (SP * Qty) - Disc;
            }
            lblBal.Text = Amount.ToString();
        }
        private void LoadBal(DataGridView grid, Label lblBa)
        {
            Decimal Amount = 0;
            foreach (DataGridViewRow row in grid.Rows)
            {
                var SP = Convert.ToDecimal(row.Cells[3].Value);
                var Qty = Convert.ToDecimal(row.Cells[4].Value);
                var Disc = Convert.ToDecimal(row.Cells[5].Value);
                Amount += (SP * Qty) - Disc;
            }
            lblBa.Text = Amount.ToString();
        }

        private void metroButton2_Click(object sender, EventArgs e)
        {
            if (gridItems.SelectedRows.Count > 0)
            {
                var itemID = Convert.ToInt32(gridItems.SelectedRows[0].Cells[1].Value);
                AddSubQty(itemID, 1, "inc", "", "0");
            }
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            if (gridItems.Rows.Count == 0)
            {
                MessageBox.Show("Please Add Items In Grid", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            if (DineIn == true)
            {
                savePrint("print");
            }
            else
            {
                txtGrandtotal1.Text = lblBal.Text;
                btnSave.Enabled = false;
                pnlTotal.Show();
                if (HomeDelivery == true)
                {
                    txtMob.Focus();
                }
                else
                {
                    cmbxDis1.Focus();
                }
            }
        }

        private void savePrint(string type)
        {
            tbl_Order order = null;
            Orders PrintOrderList = new Orders();
            using (var transaction = db.Database.BeginTransaction())
            {
                try
                {
                    order = new tbl_Order();
                    if (lblTableID.Text == "00" && DineIn == true)
                    {
                        MessageBox.Show("Table is Not Selected");
                        return;
                    }
                    int orderID = Convert.ToInt32(lblDineInID.Text);

                    if (DineIn == true)
                    {
                        if (orderID == 0)
                        {
                            order = new tbl_Order();
                            order.Amount = 0;
                            order.OrderNo = "D" + GenerateRandomNo();
                            order.OrderDate = dtCreatdDate.Value;
                            order.KOTID = "1";
                        }
                        else
                        {
                            order = db.tbl_Order.Where(x => x.OrderId == orderID && x.OrderType == "DineIn").FirstOrDefault();
                        }
                        order.TblID = db.tbl_Table.Where(x => x.TableName == lblTableID.Text).FirstOrDefault().ID;
                        order.isComplete = false;
                        order.WaiterID = Convert.ToInt32(cmbxWaiter.SelectedValue);
                        order.Discount = Convert.ToDecimal(textBox7.Text.DefaultZero());
                        order.GST = Convert.ToDecimal(txtGstTotl.Text.DefaultZero());
                        order.OrderType = "DineIn";
                    }
                    else if (takeAway == true)
                    {
                        order.OrderType = "TakeAway";
                        order.OrderNo = "T" + GenerateRandomNo();
                        order.TblID = Convert.ToInt32(label30.Text);
                        order.isComplete = true;
                        order.Amount = 0;
                        order.dueAmt = 0;
                        order.Discount = Convert.ToDecimal(textBoex.Text.DefaultZero());
                        order.GST = Convert.ToDecimal(txtGstTotl2.Text.DefaultZero());
                        order.KOTID = comboBox1.SelectedValue.ToString();
                        order.OrderDate = dtCreatdDate.Value;
                        order.WaiterID = Convert.ToInt32(cmbxWaiter.SelectedValue);
                    }
                    else if (HomeDelivery == true)
                    {
                        order.OrderType = "HomeDelivery";
                        order.OrderNo = "H" + GenerateRandomNo();
                        order.TblID = 0;
                        order.isComplete = true;
                        order.Amount = 0;
                        order.dueAmt = Convert.ToDecimal(txtGrandtotal1.Text.DefaultZero());
                        order.Discount = Convert.ToDecimal(textBoex.Text.DefaultZero());
                        order.GST = Convert.ToDecimal(txtGstTotl2.Text.DefaultZero());
                        order.WaiterID = Convert.ToInt32(cmbxWaiter.SelectedValue);
                        order.KOTID = txtCards2.Text;
                        order.OrderDate = dtCreatdDate.Value;
                    }
                    else if (Express == true)
                    {
                        order.OrderType = txtMob.Text;
                        order.OrderNo = "E" + GenerateRandomNo();
                        order.TblID = Convert.ToInt32(label30.Text);
                        order.isComplete = true;
                        order.Amount = Convert.ToDecimal(txtGrandtotal1.Text.DefaultZero());
                        order.Discount = Convert.ToDecimal(textBoex.Text.DefaultZero());
                        order.GST = Convert.ToDecimal(txtGstTotl2.Text.DefaultZero());
                        order.KOTID = txtCards2.Text;
                        order.OrderDate = dtCreatdDate.Value;
                    }

                    order.userID = Convert.ToInt32(UsrID);
                    order.CompanyID = UserObj.AccessFailedCount;

                    if (orderID == 0 && DineIn == true)
                    {
                        db.tbl_Order.Add(order);
                    }
                    if (DineIn == false)
                    {
                        db.tbl_Order.Add(order);
                    }
                    db.SaveChanges();

                    if (DineIn == true)
                    {
                        lblDineInID.Text = order.OrderId.ToString();
                    }
                    label4.Text = order.OrderNo.ToString();

                    tbl_KOT kot = new tbl_KOT();
                    kot.iscomplete = true;
                    kot.OrderID = order.OrderId.ToString();
                    kot.KotNo = "KOT-" + order.OrderNo;
                    db.tbl_KOT.Add(kot);
                    db.SaveChanges();

                    lblKOT.Text = kot.Id.ToString();
                    Decimal Amount = 0;
                    foreach (DataGridViewRow row in gridItems.Rows)
                    {
                        tbl_OrderDetails details = new tbl_OrderDetails();
                        details.OrderId = order.OrderId;
                        details.CatID = Convert.ToInt32(row.Cells[0].Value.DefaultZero());
                        details.itemID = Convert.ToInt32(row.Cells[1].Value.DefaultZero());
                        var item = db.Items.Where(x => x.IID == details.itemID && x.CompanyID == UserObj.AccessFailedCount).FirstOrDefault();
                        details.itemDtl = row.Cells[7].Value.ToString();
                        details.Rate = Convert.ToDecimal(row.Cells[3].Value.DefaultZero());
                        details.Qty = Convert.ToDecimal(row.Cells[4].Value.DefaultZero());
                        details.disc = Convert.ToDecimal(row.Cells[5].Value.DefaultZero());
                        details.KOTID = kot.Id.ToString();
                        Amount += (details.Rate * details.Qty) - details.disc ?? 0;
                        db.tbl_OrderDetails.Add(details);
                        db.SaveChanges();
                        details.itemName = row.Cells[2].Value.ToString();
                        PrintOrderList.OrderDetailsModel.Add(details);

                        //if (DineIn == false)
                        //{
                        //    LedgerEntires(details);
                        //}
                        //if (txtDisfooter.Text != "0")
                        //{
                        //    int customer = Convert.ToInt32(cmbxvendor.SelectedIndex);
                        //    var Expense = db.COA_D.Where(x => x.AC_Code == 16000001).FirstOrDefault();
                        //    var customerDetial = db.COA_D.Where(x => x.AC_Code == customer).FirstOrDefault();

                        //    GL gl = new GL();
                        //    gl.RID = details.OrderId;
                        //    gl.TypeCode = 5;
                        //    gl.GLDate = dtCreatdDate.Value;

                        //    gl.AC_Code = Expense.AC_Code;
                        //    gl.AC_Code2 = Convert.ToInt32(cmbxvendor.SelectedValue);
                        //    gl.Narration = cmbxvendor.SelectedText;

                        //    gl.DisAmt = 0;
                        //    gl.Debit = Convert.ToDouble(txtDisfooter.Text);
                        //    gl.Credit = 0;
                        //    db.GL.Add(gl);
                        //    db.SaveChanges();

                        //    GL gl1 = new GL();
                        //    gl1.RID = details.OrderId;
                        //    gl1.TypeCode = 5;
                        //    gl1.GLDate = dtCreatdDate.Value;
                        //    gl1.IPrice = Convert.ToDouble(row.Cells[4].Value.DefaultZero());
                        //    gl1.AC_Code = Convert.ToInt32(cmbxvendor.SelectedValue);
                        //    gl1.AC_Code2 = Expense.AC_Code;
                        //    gl1.Narration = Expense.AC_Title;
                        //    gl1.Debit = 0;
                        //    gl1.Credit = Convert.ToDouble(txtDisfooter.Text);
                        //    db.GL.Add(gl1);
                        //    db.SaveChanges();
                        //}
                    }

                    var orders = db.tbl_Order.Where(x => x.OrderId == order.OrderId).FirstOrDefault();
                    if (orders != null && DineIn == true)
                    {
                        order.Amount += Amount;
                        db.Entry(order).State = EntityState.Modified;
                        db.SaveChanges();
                    }
                    PrintOrderList.Order = order;
                    string OrderType = order.OrderType;
                    if (type == "print")
                    {

                        switch (OrderType)
                        {
                            case "DineIn":
                                DialogResult dialogResult = MessageBox.Show("Want to Print", "Print", MessageBoxButtons.YesNo);
                                if (dialogResult == DialogResult.Yes)
                                {
                                    SilentPrint(PrintOrderList, false);
                                }
                                break;
                            case "TakeAway":
                                if (compy == 1018 || compy == 1019 || compy == 1020 || compy == 1021 || compy == 1013)
                                {
                                    SilentPrint(PrintOrderList, true);
                                }
                                else
                                {
                                    SilentPrint(PrintOrderList, true);
                                    SilentPrint(PrintOrderList, false);
                                }

                                break;
                            case "HomeDelivery":
                                if (compy == 1018 || compy == 1019 || compy == 1020 || compy == 1021 || compy == 1013)
                                {
                                    SilentPrint(PrintOrderList, true);
                                }
                                else
                                {
                                    SilentPrint(PrintOrderList, true);
                                    SilentPrint(PrintOrderList, false);
                                }

                                break;
                            default:
                                var dsa = "dsad";
                                break;
                        }
                    }
                    // start
                    if (OrderType == "TakeAway" || OrderType == "HomeDelivery")
                    {

                        foreach (DataGridViewRow row in gridItems.Rows)
                        {
                            if (row.Cells[0].Value != null)
                            {

                                int Ridid = Convert.ToInt32(row.Cells[1].Value.DefaultZero());
                                var item = db.Items.Where(x => x.IID == Ridid).FirstOrDefault();
                                var checkstock = db.Items.Where(x => x.IID == Ridid).FirstOrDefault();
                                if (checkstock.Inv_YN == false)
                                {
                                    Itemledger ledger = new Itemledger();
                                    ledger.RID = order.OrderId;
                                    ledger.IID = Convert.ToInt32(row.Cells[1].Value.DefaultZero());
                                    ledger.EDate = dtCreatdDate.Value;
                                    // ledger.Bnid = BatchNo
                                    ledger.TypeCode = 24;
                                    ledger.AC_CODE = Convert.ToInt32(cmbxvendor.SelectedValue);

                                    //jhjhjjjjjjjj



                                    ledger.WID = (int)cmbxWarehouse.SelectedValue;
                                    // ledger.SID = (int)cmbxSaleMan.SelectedValue;


                                    // ledger.SiD =
                                    //    var ctnledger = Convert.ToDouble(item.CTN_PCK.DefaultZero()) * Convert.ToDouble(row.Cells[2].Value.DefaultZero());
                                    //  ledger.CTN = Convert.ToDouble(row.Cells[2].Value.ToString());
                                    ledger.PCS = Convert.ToDouble(row.Cells[4].Value.ToString());
                                    ledger.SJ = /*ctn +*/ Convert.ToDouble(row.Cells[4].Value);
                                    ledger.PurPrice = Convert.ToDouble(item.AveragePrice.DefaultZero());
                                    ledger.SalesPriceP = Convert.ToDouble(row.Cells[3].Value.ToString());//  ledger.Pamt = TotalAmount(pj * PurPrice)
                                                                                                         //  ledger.DisP = Convert.ToDouble(row.Cells[6].Value.DefaultZero());
                                                                                                         //ledger.DisAmount = percentage in rupess
                                                                                                         // ledger.DisRs = Convert.ToDouble(row.Cells[5].Value.DefaultZero());
                                    ledger.Amt = Convert.ToDouble(row.Cells[6].Value.DefaultZero());
                                    ledger.DisAmt = Convert.ToDouble(row.Cells[5].Value.DefaultZero());
                                    ledger.CompanyID = compy;

                                    db.Itemledger.Add(ledger);
                                    db.SaveChanges();

                                    GL gl = new GL();
                                    gl.RID = order.OrderId;
                                    gl.TypeCode = 24;

                                    // jhkjhkjh
                                    //gl.SID = (int)cmbxSaleMan.SelectedValue;

                                    gl.GLDate = dtCreatdDate.Value;
                                    gl.IPrice = Convert.ToDouble(row.Cells[3].Value.DefaultZero());
                                    gl.AC_Code = Convert.ToInt32(cmbxvendor.SelectedValue);
                                    gl.AC_Code2 = item.AC_Code_Inv;
                                    //  gl.Narration = row.Cells[1].Value.ToString();
                                    //  gl.MOP_ID = 2;
                                    gl.Qty_Out = /*ctn +*/ Convert.ToDouble(row.Cells[4].Value);
                                    gl.PAmt = Convert.ToDouble(row.Cells[3].Value.DefaultZero());
                                    //gl.DisP = Convert.ToDouble(row.Cells[6].Value ?? "0");
                                    //gl.DisRs = Convert.ToDouble((row.Cells[7].Value ?? "0"));
                                    gl.DisAmt = Convert.ToDouble(row.Cells[5].Value.DefaultZero());//Convert.ToDouble(txtSaleRate.Text);
                                    gl.Debit = Convert.ToDouble(row.Cells[6].Value.DefaultZero());
                                    gl.CompID = compy;
                                    gl.Credit = 0;
                                    db.GL.Add(gl);
                                    db.SaveChanges();

                                    GL gl1 = new GL();
                                    gl1.RID = order.OrderId;
                                    gl1.TypeCode = 24;
                                    //kljlkj
                                    //gl1.SID = (int)cmbxSaleMan.SelectedValue;
                                    gl1.GLDate = dtCreatdDate.Value;
                                    gl1.IPrice = item.AveragePrice;
                                    gl1.AC_Code = item.AC_Code_Inv;
                                    gl1.AC_Code2 = Convert.ToInt32(cmbxvendor.SelectedValue);
                                    gl1.Narration = cmbxvendor.SelectedText;
                                    //  gl.MOP_ID = 2;
                                    gl1.Qty_Out = /*ctn +*/ Convert.ToDouble(row.Cells[3].Value);
                                    gl1.PAmt = Convert.ToDouble(item.AveragePrice.DefaultZero()) * (/*ctn +*/ Convert.ToDouble(row.Cells[4].Value));//Convert.ToDouble(row.Cells[5].Value.DefaultZero());
                                    gl1.DisP = 0;// Convert.ToDouble(row.Cells[6].Value ?? "0");
                                    gl1.DisRs = 0; //Convert.ToDouble((row.Cells[7].Value ?? "0"));
                                    gl1.DisAmt = 0;// Convert.ToDouble(Convert.ToDouble(row.Cells[6].Value.DefaultZero()) / 100 * Convert.ToDouble(row.Cells[5].Value.DefaultZero()));//Convert.ToDouble(txtSaleRate.Text);
                                    gl1.Debit = 0;
                                    gl1.Credit = Convert.ToDouble(item.AveragePrice.DefaultZero()) * (/*ctn +*/ Convert.ToDouble(row.Cells[4].Value));
                                    gl1.CompID = compy;
                                    db.GL.Add(gl1);
                                    db.SaveChanges();


                                    GL gl2 = new GL();
                                    gl2.RID = order.OrderId;
                                    gl2.TypeCode = 24;
                                    //  jkjhkjh
                                    //gl2.SID = (int)cmbxSaleMan.SelectedValue;
                                    gl2.GLDate = dtCreatdDate.Value;
                                    gl2.IPrice = Convert.ToDouble(row.Cells[4].Value.DefaultZero());
                                    gl2.AC_Code = item.AC_Code_Inc;
                                    gl2.AC_Code2 = Convert.ToInt32(cmbxvendor.SelectedValue);
                                    gl2.Narration = cmbxvendor.SelectedText;
                                    //  gl.MOP_ID = 2;
                                    gl2.Qty_Out = /*ctn +*/ Convert.ToDouble(row.Cells[4].Value);
                                    gl2.PAmt = Convert.ToDouble(row.Cells[3].Value.DefaultZero());
                                    //gl2.DisP = Convert.ToDouble(row.Cells[6].Value ?? "0");
                                    //gl2.DisRs = Convert.ToDouble((row.Cells[7].Value ?? "0"));
                                    gl2.DisAmt = Convert.ToDouble(row.Cells[5].Value.DefaultZero());//Convert.ToDouble(txtSaleRate.Text);
                                    gl2.Debit = 0;
                                    gl2.Credit = Convert.ToDouble(row.Cells[6].Value.DefaultZero());
                                    gl2.CompID = compy;
                                    db.GL.Add(gl2);
                                    db.SaveChanges();

                                    GL gl3 = new GL();
                                    gl3.RID = order.OrderId;
                                    gl3.TypeCode = 24;

                                    //hjhkjhk
                                    //gl3.SID = (int)cmbxSaleMan.SelectedValue;
                                    gl3.GLDate = dtCreatdDate.Value;
                                    gl3.IPrice = item.AveragePrice;
                                    gl3.AC_Code = item.AC_Code_Cost;
                                    gl3.AC_Code2 = Convert.ToInt32(cmbxvendor.SelectedValue);
                                    gl3.Narration = cmbxvendor.SelectedText;
                                    //  gl.MOP_ID = 2;
                                    gl3.Qty_Out =/* ctn +*/ Convert.ToDouble(row.Cells[4].Value);
                                    gl3.PAmt = Convert.ToDouble(item.AveragePrice.DefaultZero()) * gl1.Qty_Out;//Convert.ToDouble(row.Cells[5].Value.DefaultZero());
                                    gl3.DisP = 0;// Convert.ToDouble(row.Cells[6].Value ?? "0");
                                    gl3.DisRs = 0; //Convert.ToDouble((row.Cells[7].Value ?? "0"));
                                    gl3.DisAmt = 0;// Convert.ToDouble(Convert.ToDouble(row.Cells[6].Value.DefaultZero()) / 100 * Convert.ToDouble(row.Cells[5].Value.DefaultZero()));//Convert.ToDouble(txtSaleRate.Text);
                                    gl3.Debit = Convert.ToDouble(item.AveragePrice.DefaultZero()) * gl1.Qty_Out; ;
                                    gl3.Credit = 0;
                                    gl3.CompID = compy;
                                    db.GL.Add(gl3);
                                    db.SaveChanges();
                                }
                                else
                                {
                                    GL gl = new GL();
                                    gl.RID = order.OrderId;
                                    gl.TypeCode = 24;


                                    // hjhkjh
                                    //gl.SID = (int)cmbxSaleMan.SelectedValue;
                                    gl.GLDate = dtCreatdDate.Value;
                                    gl.IPrice = Convert.ToDouble(row.Cells[3].Value.DefaultZero());
                                    gl.AC_Code = Convert.ToInt32(cmbxvendor.SelectedValue);
                                    gl.AC_Code2 = item.AC_Code_Inc;
                                    gl.Narration = row.Cells[1].Value.ToString();
                                    //  gl.MOP_ID = 2;
                                    // var ctnledger = Convert.ToDouble(item.CTN_PCK.DefaultZero()) * Convert.ToDouble(row.Cells[2].Value.DefaultZero());
                                    gl.Qty_Out = /*ctn +*/ Convert.ToDouble(row.Cells[4].Value);
                                    gl.PAmt = Convert.ToDouble(row.Cells[3].Value.DefaultZero());
                                    //gl.DisP = Convert.ToDouble(row.Cells[6].Value ?? "0");
                                    //gl.DisRs = Convert.ToDouble((row.Cells[7].Value ?? "0"));
                                    gl.DisAmt = Convert.ToDouble(row.Cells[5].Value.DefaultZero()); //Convert.ToDouble(txtSaleRate.Text);
                                    gl.Debit = Convert.ToDouble(row.Cells[6].Value.DefaultZero());
                                    gl.Credit = 0;
                                    gl.CompID = compy;
                                    db.GL.Add(gl);
                                    db.SaveChanges();

                                    GL gl1 = new GL();
                                    gl1.RID = order.OrderId;
                                    gl1.TypeCode = 24;

                                    //jhkjhjk
                                    //gl1.SID = (int)cmbxSaleMan.SelectedValue;
                                    gl1.GLDate = dtCreatdDate.Value;
                                    gl1.IPrice = Convert.ToDouble(row.Cells[4].Value.DefaultZero());
                                    gl1.AC_Code = item.AC_Code_Inc;
                                    gl1.AC_Code2 = Convert.ToInt32(cmbxvendor.SelectedValue);
                                    gl1.Narration = cmbxvendor.SelectedText;
                                    //  gl.MOP_ID = 2;
                                    gl1.Qty_Out = /*ctn +*/ Convert.ToDouble(row.Cells[3].Value);
                                    gl1.PAmt = Convert.ToDouble(row.Cells[3].Value.DefaultZero()) * Convert.ToDouble(row.Cells[4].Value.DefaultZero());

                                    gl1.DisAmt = Convert.ToDouble(row.Cells[5].Value.DefaultZero());
                                    gl1.Debit = 0;
                                    gl1.Credit = Convert.ToDouble(row.Cells[6].Value.DefaultZero());
                                    gl1.CompID = compy;
                                    db.GL.Add(gl1);
                                    db.SaveChanges();



                                    var recipe = db.tbl_Receipe.AsNoTracking().Where(x => x.compy == compy && x.isActive == false && x.ItemID == Ridid).ToList();

                                    if (recipe == null)
                                    {

                                    }

                                    else
                                    {

                                        foreach (var receipe in recipe)
                                        {
                                            var itemvalues = db.Items.AsNoTracking().Where(x => x.IID == receipe.RecipceItemId).FirstOrDefault();

                                            Itemledger ledger = new Itemledger();
                                            ledger.RID = order.OrderId;
                                            ledger.IID = itemvalues.IID;
                                            ledger.EDate = dtCreatdDate.Value;
                                            // ledger.Bnid = BatchNo
                                            ledger.TypeCode = 24;
                                            ledger.AC_CODE = Convert.ToInt32(cmbxvendor.SelectedValue);

                                            //jhjhjjjjjjjj

                                            //ledger.WID = (int)cmbxWareHouse.SelectedValue;
                                            //ledger.SID = (int)cmbxSaleMan.SelectedValue;


                                            // ledger.SiD =
                                            //    var ctnledger = Convert.ToDouble(item.CTN_PCK.DefaultZero()) * Convert.ToDouble(row.Cells[2].Value.DefaultZero());
                                            //  ledger.CTN = Convert.ToDouble(row.Cells[2].Value.ToString());
                                            ledger.PCS = Convert.ToDouble(receipe.qty);
                                            ledger.SJ = Convert.ToDouble(receipe.qty);
                                            ledger.PurPrice = Convert.ToDouble(itemvalues.AveragePrice.DefaultZero());
                                            ledger.SalesPriceP = 0;//  ledger.Pamt = TotalAmount(pj * PurPrice)
                                                                   //  ledger.DisP = Convert.ToDouble(row.Cells[6].Value.DefaultZero());
                                                                   //ledger.DisAmount = percentage in rupess
                                                                   // ledger.DisRs = Convert.ToDouble(row.Cells[5].Value.DefaultZero());
                                            ledger.Amt = 0;
                                            ledger.DisAmt = 0;
                                            ledger.CompanyID = compy;

                                            db.Itemledger.Add(ledger);
                                            db.SaveChanges();

                                            GL glv = new GL();
                                            glv.RID = order.OrderId;
                                            glv.TypeCode = 24;

                                            // jhkjhkjh
                                            //gl.SID = (int)cmbxSaleMan.SelectedValue;

                                            glv.GLDate = dtCreatdDate.Value;
                                            glv.IPrice = 0;
                                            glv.AC_Code = Convert.ToInt32(cmbxvendor.SelectedValue);
                                            glv.AC_Code2 = itemvalues.AC_Code_Inv;
                                            //  gl.Narration = row.Cells[1].Value.ToString();
                                            //  gl.MOP_ID = 2;
                                            glv.Qty_Out = /*ctn +*/ Convert.ToDouble(receipe.qty);
                                            glv.PAmt = 0;
                                            //gl.DisP = Convert.ToDouble(row.Cells[6].Value ?? "0");
                                            //gl.DisRs = Convert.ToDouble((row.Cells[7].Value ?? "0"));
                                            glv.DisAmt = 0;//Convert.ToDouble(txtSaleRate.Text);
                                            glv.Debit = 0;
                                            glv.CompID = compy;
                                            glv.Credit = 0;
                                            db.GL.Add(glv);
                                            db.SaveChanges();

                                            GL glI = new GL();
                                            glI.RID = order.OrderId;
                                            glI.TypeCode = 24;
                                            //kljlkj
                                            //gl1.SID = (int)cmbxSaleMan.SelectedValue;
                                            glI.GLDate = dtCreatdDate.Value;
                                            glI.IPrice = Convert.ToDouble(itemvalues.AveragePrice.DefaultZero());
                                            glI.AC_Code = itemvalues.AC_Code_Inv;
                                            glI.AC_Code2 = Convert.ToInt32(cmbxvendor.SelectedValue);
                                            glI.Narration = cmbxvendor.SelectedText;
                                            //  gl.MOP_ID = 2;
                                            glI.Qty_Out = /*ctn +*/ Convert.ToDouble(receipe.qty);
                                            glI.PAmt = Convert.ToDouble(itemvalues.AveragePrice.DefaultZero()) * (/*ctn +*/ Convert.ToDouble(receipe.qty));//Convert.ToDouble(row.Cells[5].Value.DefaultZero());
                                            glI.DisP = 0;// Convert.ToDouble(row.Cells[6].Value ?? "0");
                                            glI.DisRs = 0; //Convert.ToDouble((row.Cells[7].Value ?? "0"));
                                            glI.DisAmt = 0;// Convert.ToDouble(Convert.ToDouble(row.Cells[6].Value.DefaultZero()) / 100 * Convert.ToDouble(row.Cells[5].Value.DefaultZero()));//Convert.ToDouble(txtSaleRate.Text);
                                            glI.Debit = 0;
                                            glI.Credit = Convert.ToDouble(itemvalues.AveragePrice.DefaultZero()) * (/*ctn +*/Convert.ToDouble(receipe.qty));
                                            glI.CompID = compy;
                                            db.GL.Add(glI);
                                            db.SaveChanges();


                                            GL gl2 = new GL();
                                            gl2.RID = order.OrderId;
                                            gl2.TypeCode = 24;
                                            //  jkjhkjh
                                            //gl2.SID = (int)cmbxSaleMan.SelectedValue;
                                            gl2.GLDate = dtCreatdDate.Value;
                                            gl2.IPrice = 0;
                                            gl2.AC_Code = itemvalues.AC_Code_Inc;
                                            gl2.AC_Code2 = Convert.ToInt32(cmbxvendor.SelectedValue);
                                            gl2.Narration = cmbxvendor.SelectedText;
                                            //  gl.MOP_ID = 2;
                                            gl2.Qty_Out = /*ctn +*/ Convert.ToDouble(receipe.qty);
                                            gl2.PAmt = 0;
                                            //gl2.DisP = Convert.ToDouble(row.Cells[6].Value ?? "0");
                                            //gl2.DisRs = Convert.ToDouble((row.Cells[7].Value ?? "0"));
                                            gl2.DisAmt = 0;//Convert.ToDouble(txtSaleRate.Text);
                                            gl2.Debit = 0;
                                            gl2.Credit = 0;
                                            gl2.CompID = compy;
                                            db.GL.Add(gl2);
                                            db.SaveChanges();

                                            GL gl3 = new GL();
                                            gl3.RID = order.OrderId;
                                            gl3.TypeCode = 24;

                                            //hjhkjhk
                                            //gl3.SID = (int)cmbxSaleMan.SelectedValue;
                                            gl3.GLDate = dtCreatdDate.Value;
                                            gl3.IPrice = itemvalues.AveragePrice;
                                            gl3.AC_Code = itemvalues.AC_Code_Cost;
                                            gl3.AC_Code2 = Convert.ToInt32(cmbxvendor.SelectedValue);
                                            gl3.Narration = cmbxvendor.SelectedText;
                                            //  gl.MOP_ID = 2;
                                            gl3.Qty_Out = Convert.ToDouble(receipe.qty);
                                            gl3.PAmt = Convert.ToDouble(itemvalues.AveragePrice.DefaultZero()) * Convert.ToDouble(receipe.qty);//Convert.ToDouble(row.Cells[5].Value.DefaultZero());
                                            gl3.DisP = 0;// Convert.ToDouble(row.Cells[6].Value ?? "0");
                                            gl3.DisRs = 0; //Convert.ToDouble((row.Cells[7].Value ?? "0"));
                                            gl3.DisAmt = 0;// Convert.ToDouble(Convert.ToDouble(row.Cells[6].Value.DefaultZero()) / 100 * Convert.ToDouble(row.Cells[5].Value.DefaultZero()));//Convert.ToDouble(txtSaleRate.Text);
                                            gl3.Debit = Convert.ToDouble(itemvalues.AveragePrice.DefaultZero()) * Convert.ToDouble(receipe.qty);
                                            gl3.Credit = 0;
                                            gl3.CompID = compy;
                                            db.GL.Add(gl3);
                                            db.SaveChanges();


                                        }
                                    }
                                    //



                                }
                                //if (txtDisfooter.Text != "0")
                                //{
                                //    int customer = Convert.ToInt32(cmbxvendor.SelectedValue);
                                //    var Expense = db.COA_D.Where(x => x.AC_Title == "Total Sale Discount Expense" && x.CompanyID == compID && x.CAC_Code == 16).FirstOrDefault();
                                //    var customerDetial = db.COA_D.Where(x => x.AC_Code == customer).FirstOrDefault();

                                //    // var Income = db.COA_D.Where(x => x.AC_Title == "Purchase Total Discount Income" && x.CompanyID == compID && x.CAC_Code == 14).FirstOrDefault();

                                //    if (Expense == null)
                                //    {






                                //        COA_D coaD = new COA_D();
                                //        coaD.CAC_Code = 16;
                                //        coaD.PType_ID = 1;
                                //        coaD.ZID = 0;
                                //        coaD.AC_Code = (int)db.GetAc_Code(16).FirstOrDefault();
                                //        coaD.AC_Title = "Total Sale Discount Expense";
                                //        coaD.DR = 0;
                                //        coaD.CR = 0;
                                //        coaD.Qty = 0;
                                //        coaD.CompanyID = compID;
                                //        coaD.InActive = false;
                                //        db.COA_D.Add(coaD);
                                //        db.SaveChanges();



                                //        Expense = db.COA_D.AsNoTracking().Where(x => x.AC_Title == "Total Sale Discount Expense" && x.CompanyID == compID && x.CAC_Code == 16).FirstOrDefault();

                                //    }


                                //    GL gl = new GL();
                                //    gl.RID = sale.RID;
                                //    gl.SID = (int)cmbxSaleMan.SelectedValue;
                                //    gl.TypeCode = 5;
                                //    gl.GLDate = dtCreatdDate.Value;
                                //    //  gl.IPrice = Convert.ToDouble(row.Cells[4].Value.DefaultZero());
                                //    gl.AC_Code = Expense.AC_Code;
                                //    gl.AC_Code2 = Convert.ToInt32(cmbxvendor.SelectedValue);
                                //    gl.Narration = customerDetial.AC_Title;
                                //    //  gl.MOP_ID = 2;
                                //    // gl.Qty_Out = (item.CTN_PCK ?? 0 * Convert.ToInt32(row.Cells[2].Value)) + Convert.ToInt32(row.Cells[3].Value);
                                //    // gl.PAmt = Convert.ToDouble(row.Cells[5].Value.DefaultZero());
                                //    //  gl.DisP = Convert.ToDouble(row.Cells[6].Value ?? "0");
                                //    //  gl.DisRs = Convert.ToDouble((row.Cells[7].Value ?? "0"));
                                //    gl.DisAmt = 0;
                                //    gl.Debit = Convert.ToDouble(txtDisfooter.Text);
                                //    gl.Credit = 0;
                                //    gl.CompID = compID;
                                //    db.GL.Add(gl);
                                //    db.SaveChanges();

                                //    GL gl1 = new GL();
                                //    gl1.RID = sale.RID;
                                //    gl1.TypeCode = 5;
                                //    gl1.SID = (int)cmbxSaleMan.SelectedValue;
                                //    gl1.GLDate = dtCreatdDate.Value;
                                //    gl1.IPrice = Convert.ToDouble(row.Cells[4].Value.DefaultZero());
                                //    gl1.AC_Code = Convert.ToInt32(cmbxvendor.SelectedValue);
                                //    gl1.AC_Code2 = Expense.AC_Code;
                                //    gl1.Narration = Expense.AC_Title;
                                //    //  gl.MOP_ID = 2;
                                //    // gl1.Qty_Out = (item.CTN_PCK ?? 0 * Convert.ToInt32(row.Cells[2].Value)) + Convert.ToInt32(row.Cells[3].Value);
                                //    //gl1.PAmt = Convert.ToDouble(row.Cells[5].Value.DefaultZero());
                                //    //gl1.DisP = Convert.ToDouble(row.Cells[6].Value ?? "0");
                                //    //gl1.DisRs = Convert.ToDouble((row.Cells[7].Value ?? "0"));
                                //    //gl1.DisAmt = Convert.ToDouble(Convert.ToDouble(row.Cells[6].Value.DefaultZero()) / 100 * Convert.ToDouble(row.Cells[5].Value.DefaultZero()));//Convert.ToDouble(txtSaleRate.Text);
                                //    gl1.Debit = 0;
                                //    gl1.Credit = Convert.ToDouble(txtDisfooter.Text);
                                //    gl1.CompID = compID;
                                //    db.GL.Add(gl1);
                                //    db.SaveChanges();
                                //}
                            }
                        }








                    }
                    //end

                    pnlTotal.Hide();
                    transaction.Commit();
                    clear();

                }
                catch (DbEntityValidationException ex)
                {
                    transaction.Rollback();
                    //string msg = "";
                    //foreach (var eve in ex.EntityValidationErrors)
                    //{
                    //    msg = "Entity of type \"{0}\" in state \"{1}\" has the following validation errors: " + eve.Entry.Entity.GetType().Name + eve.Entry.State;
                    //    foreach (var ve in eve.ValidationErrors)
                    //    {
                    //        msg += "- Property: \"{0}\", Error: \"{1}\" " + ve.PropertyName + ve.ErrorMessage;
                    //    }
                    //}
                    //Lib.Entity.Excption Excepti = new Lib.Entity.Excption();
                    //Excepti.ExcptionName = msg;
                    //db.Excptions.Add(Excepti);
                    //db.SaveChanges();
                }
            }
        }

        private void LedgerEntires(tbl_OrderDetails details)
        {
            var checkstock = db.Items.Where(x => x.IID == details.itemID).FirstOrDefault();
            if (checkstock.Inv_YN == false)
            {
                //prc_SaveItemLedger
                SqlCommand cmd = new SqlCommand("prc_SaveItemLedger", SqlHelper.DefaultSqlConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@RID", details.OrderId);
                cmd.Parameters.AddWithValue("@IID", details.itemID);
                cmd.Parameters.AddWithValue("@EDate", dtCreatdDate.Value);
                cmd.Parameters.AddWithValue("@TypeCode", 24);
                cmd.Parameters.AddWithValue("@AC_CODE", Convert.ToInt32(cmbxvendor.SelectedValue));
                cmd.Parameters.AddWithValue("@WID", 1);
                cmd.Parameters.AddWithValue("@CTN", 0);
                cmd.Parameters.AddWithValue("@PCS", Convert.ToDouble(details.Qty));
                cmd.Parameters.AddWithValue("@SJ", 0 + Convert.ToDouble(details.Rate));
                cmd.Parameters.AddWithValue("@PurPrice", Convert.ToDouble(checkstock.AveragePrice.DefaultZero()));
                cmd.Parameters.AddWithValue("@SalesPriceP", Convert.ToDouble(details.Rate));
                cmd.Parameters.AddWithValue("@DisP", Convert.ToDouble(details.disc));
                cmd.Parameters.AddWithValue("@DisRs", Convert.ToDouble(details.disc));
                cmd.Parameters.AddWithValue("@Amt", Convert.ToDouble(details.Rate) * Convert.ToDouble(details.Qty));
                cmd.Parameters.AddWithValue("@DisAmt", Convert.ToDouble(details.disc));
                var rows = SqlHelper.ExecuteNonQuery(cmd);


                //if (rows.Count > 0)
                //{
                //    //var row = rows[0];
                //    //OrderNo = row["OrdrID"].ToString();
                //}

                //Itemledger ledger = new Itemledger();
                //ledger.RID = details.OrderId;
                //ledger.IID = details.itemID;
                //ledger.EDate = dtCreatdDate.Value;
                //ledger.TypeCode = 23;
                //ledger.AC_CODE = Convert.ToInt32(cmbxvendor.SelectedValue);
                //ledger.WID = 1;
                //ledger.CTN = 0;
                //ledger.PCS = Convert.ToDouble(details.Qty);
                //ledger.SJ = 0 + Convert.ToDouble(details.Rate);
                //ledger.PurPrice = Convert.ToDouble(checkstock.AveragePrice.DefaultZero());
                //ledger.SalesPriceP = Convert.ToDouble(details.Rate);
                //ledger.DisP = Convert.ToDouble(details.disc);
                //ledger.DisRs = Convert.ToDouble(details.disc);
                //ledger.Amt = Convert.ToDouble(details.Rate) * Convert.ToDouble(details.Qty);
                //ledger.DisAmt = Convert.ToDouble(details.disc);
                //db.Itemledgers.Add(ledger);
                //db.SaveChanges();

                GL gl = new GL();
                gl.RID = details.OrderId;
                gl.TypeCode = 24;
                gl.GLDate = dtCreatdDate.Value;
                gl.IPrice = Convert.ToDouble(details.Rate);
                gl.AC_Code = Convert.ToInt32(cmbxvendor.SelectedValue);
                gl.AC_Code2 = checkstock.AC_Code_Inv;
                gl.Narration = details.itemID.ToString();
                //  gl.MOP_ID = 2;
                gl.Qty_Out = 0 + Convert.ToDouble(details.Rate);
                gl.PAmt = Convert.ToDouble(details.Rate) * Convert.ToDouble(details.Qty);
                gl.DisP = Convert.ToDouble(details.disc);
                gl.DisRs = Convert.ToDouble(details.disc);
                gl.DisAmt = Convert.ToDouble(details.disc);
                gl.Debit = Convert.ToDouble((details.Rate * details.Qty) - details.disc ?? 0);
                gl.Credit = 0;
                db.GL.Add(gl);
                db.SaveChanges();

                //SqlCommand cmdGL = new SqlCommand("prc_SaveGL", SqlHelper.DefaultSqlConnection);
                //cmdGL.CommandType = CommandType.StoredProcedure;
                //cmdGL.Parameters.AddWithValue("@RID", details.OrderId);
                //cmdGL.Parameters.AddWithValue("@TypeCode", 23);
                //cmdGL.Parameters.AddWithValue("@GLDate", dtCreatdDate.Value);
                //cmdGL.Parameters.AddWithValue("@IPrice", Convert.ToDouble(details.Rate));
                //cmdGL.Parameters.AddWithValue("@AC_Code", Convert.ToInt32(cmbxvendor.SelectedValue));
                //cmdGL.Parameters.AddWithValue("@AC_Code2", checkstock.AC_Code_Inv);
                //cmdGL.Parameters.AddWithValue("@Narration", details.itemID.ToString());
                //cmdGL.Parameters.AddWithValue("@Qty_Out", 0 + Convert.ToDouble(details.Rate));
                //cmdGL.Parameters.AddWithValue("@PAmt", Convert.ToDouble(details.Rate) * Convert.ToDouble(details.Qty));
                //cmdGL.Parameters.AddWithValue("@DisP", Convert.ToDouble(details.disc));
                //cmdGL.Parameters.AddWithValue("@DisRs", Convert.ToDouble(details.disc));
                //cmdGL.Parameters.AddWithValue("@DisAmt", Convert.ToDouble(details.disc));
                //cmdGL.Parameters.AddWithValue("@Debit", Convert.ToDouble((details.Rate * details.Qty) - details.disc ?? 0));
                //cmdGL.Parameters.AddWithValue("@Credit", 0);                
                //var rowsGL = SqlHelper.ExecuteNonQuery(cmd);

                GL gl1 = new GL();
                gl1.RID = details.OrderId;
                gl1.TypeCode = 24;
                gl1.GLDate = dtCreatdDate.Value;
                gl1.IPrice = checkstock.AveragePrice;
                gl1.AC_Code = checkstock.AC_Code_Inv;
                gl1.AC_Code2 = Convert.ToInt32(cmbxvendor.SelectedValue);
                gl1.Narration = cmbxvendor.SelectedText;
                //  gl.MOP_ID = 2;
                gl1.Qty_Out = 0 + Convert.ToDouble(details.Rate);
                gl1.PAmt = Convert.ToDouble(details.Rate) * Convert.ToDouble(details.Qty);
                gl1.DisP = 0;// Convert.ToDouble(row.Cells[6].Value ?? "0");
                gl1.DisRs = 0; //Convert.ToDouble((row.Cells[7].Value ?? "0"));
                gl1.DisAmt = 0;// Convert.ToDouble(Convert.ToDouble(row.Cells[6].Value.DefaultZero()) / 100 * Convert.ToDouble(row.Cells[5].Value.DefaultZero()));//Convert.ToDouble(txtSaleRate.Text);
                gl1.Debit = 0;
                gl1.Credit = Convert.ToDouble(checkstock.AveragePrice.DefaultZero()) * Convert.ToDouble(details.Rate);
                db.GL.Add(gl1);
                db.SaveChanges();


                GL gl2 = new GL();
                gl2.RID = details.OrderId;
                gl2.TypeCode = 24;
                gl2.GLDate = dtCreatdDate.Value;
                gl2.IPrice = Convert.ToDouble(details.Rate);
                gl2.AC_Code = checkstock.AC_Code_Inc;
                gl2.AC_Code2 = Convert.ToInt32(cmbxvendor.SelectedValue);
                gl2.Narration = cmbxvendor.SelectedText;
                //  gl.MOP_ID = 2;
                gl2.Qty_Out = 0 + Convert.ToDouble(details.Rate);
                gl2.PAmt = Convert.ToDouble(details.Rate) * Convert.ToDouble(details.Qty);
                gl2.DisP = Convert.ToDouble(details.disc);
                gl2.DisRs = Convert.ToDouble(details.disc);
                gl2.DisAmt = Convert.ToDouble(details.disc);
                gl2.Debit = 0;
                gl2.Credit = Convert.ToDouble((details.Rate * details.Qty) - details.disc ?? 0);
                db.GL.Add(gl2);
                db.SaveChanges();

                GL gl3 = new GL();
                gl3.RID = details.OrderId;
                gl3.TypeCode = 24;
                gl3.GLDate = dtCreatdDate.Value;

                gl3.AC_Code = checkstock.AC_Code_Cost;
                gl3.AC_Code2 = Convert.ToInt32(cmbxvendor.SelectedValue);
                gl3.Narration = cmbxvendor.SelectedText;
                //  gl.MOP_ID = 2;
                gl3.Qty_Out = 0 + Convert.ToDouble(details.Rate);
                gl3.PAmt = Convert.ToDouble(details.Rate) * Convert.ToDouble(details.Qty);
                gl3.DisP = 0;// Convert.ToDouble(row.Cells[6].Value ?? "0");
                gl3.DisRs = 0; //Convert.ToDouble((row.Cells[7].Value ?? "0"));
                gl3.DisAmt = 0;// Convert.ToDouble(Convert.ToDouble(row.Cells[6].Value.DefaultZero()) / 100 * Convert.ToDouble(row.Cells[5].Value.DefaultZero()));//Convert.ToDouble(txtSaleRate.Text);
                gl3.Debit = Convert.ToDouble(checkstock.AveragePrice.DefaultZero()) * gl1.Qty_Out; ;
                gl3.Credit = 0;
                db.GL.Add(gl3);
                db.SaveChanges();

            }
            else
            {
                GL gl = new GL();
                gl.RID = details.OrderId;
                gl.TypeCode = 24;
                gl.GLDate = dtCreatdDate.Value;
                gl.IPrice = Convert.ToDouble(details.Rate);
                gl.AC_Code = Convert.ToInt32(cmbxvendor.SelectedValue);
                gl.AC_Code2 = checkstock.AC_Code_Inc;
                gl.Narration = details.itemID.ToString();
                //  gl.MOP_ID = 2;
                // var ctnledger = Convert.ToDouble(item.CTN_PCK.DefaultZero()) * Convert.ToDouble(row.Cells[2].Value.DefaultZero());
                gl.Qty_Out = 0 + Convert.ToDouble(details.Rate);
                gl.PAmt = Convert.ToDouble(details.Rate) * Convert.ToDouble(details.Qty);
                gl.DisP = Convert.ToDouble(details.Rate);
                gl.DisRs = Convert.ToDouble(details.disc);
                gl.DisAmt = Convert.ToDouble(details.Rate);
                gl.Debit = Convert.ToDouble((details.Rate * details.Qty) - details.disc ?? 0);
                gl.Credit = 0;
                db.GL.Add(gl);
                db.SaveChanges();

                GL gl1 = new GL();
                gl1.RID = details.OrderId;
                gl1.TypeCode = 24;
                gl1.GLDate = dtCreatdDate.Value;
                gl1.IPrice = Convert.ToDouble(details.Rate);
                gl1.AC_Code = checkstock.AC_Code_Inc;
                gl1.AC_Code2 = Convert.ToInt32(cmbxvendor.SelectedValue);
                gl1.Narration = cmbxvendor.SelectedText;
                //  gl.MOP_ID = 2;
                gl1.Qty_Out = 0 + Convert.ToDouble(details.Rate);
                gl1.PAmt = Convert.ToDouble(details.Rate) * Convert.ToDouble(details.Qty);
                gl1.DisP = Convert.ToDouble(details.disc);
                gl1.DisRs = Convert.ToDouble(details.disc);
                gl1.DisAmt = Convert.ToDouble(details.disc);
                gl1.Debit = 0;
                gl1.Credit = Convert.ToDouble((details.Rate * details.Qty) - details.disc ?? 0);
                db.GL.Add(gl1);
                db.SaveChanges();
            }
        }
        public String GenerateRandomNo()
        {
            String OrdrNoString = "0001";
            String OrderNo = "0";

            var dt = ReportsController.GetNewSerialNo();
            if (dt.Rows.Count > 0)
            {
                var row = dt.Rows[0];
                OrderNo = row["OrdrID"].ToString();
            }

            int NewOrdrN = Convert.ToInt32(OrderNo) + 1;
            OrdrNoString = NewOrdrN.ToString();
            if (OrdrNoString.Count() == 1)
            {
                OrdrNoString = "000" + OrdrNoString;
            }
            else if (OrdrNoString.Count() == 2)
            {
                OrdrNoString = "00" + OrdrNoString;
            }
            else if (OrdrNoString.Count() == 3)
            {
                OrdrNoString = "0" + OrdrNoString;
            }

            return OrdrNoString;
        }

        private void clear()
        {
            // cmbxItems.SelectedIndex = -1;
            //  txtBatch.Text = "0";
            lblBal.Text = "0.0";
            gridItems.DataSource = null;
            gridItems.Rows.Clear();
            //  txtNetAm.Text = "0";
            // txtTotalAm.Text = "0";
            txtGstAmt2.Text = "";
            textBox52.Text = "";
            textBox2.Text = "";
            textBox7.Text = "";
            txtGstAmt.Text = "";
            textBox5.Text = "";
            txtCards.Text = "";
            txtCards2.Text = "";
            txtGrandtotal.Text = "";
            txtGrandtotal1.Text = "";
            txtGstTotl2.Text = "";
            txtGstTotl.Text = "";
            textBoex.Text = "";
            pnlChk.Controls.OfType<RadioButton>().ToList().ForEach(btn => btn.Dispose());
            gridInv.DataSource = null;
            gridInv.Rows.Clear();
            txtGrandtotal.Text = "";
            panel7.Hide();
            panel3.Hide();
            pnlTotal.Hide();
            //lblOrderID.Text = "0"

            foreach (var control in pnlTotal.Controls)
            {
                if (control is TextBox)
                {
                    ((TextBox)control).Text = "";
                }
            }
        }

        private void cmbxWaiter_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbxWaiter.SelectedValue is Lib.Entity.tbl_Employee)
            {

            }
            else if (DineIn)
            {
                var id = cmbxWaiter.SelectedValue.ToString();
                TablsList table = new TablsList(compy, "new", lblTblID.Text, UsrID, this, UserObj, cmbxWaiter, id);
                this.Hide();
                table.Show();
            }
        }

        private void metroButton10_Click(object sender, EventArgs e)
        {
            cmbxWaiter.DroppedDown = true;
            cmbxWaiter.Focus();
        }

        private void metroButton9_Click(object sender, EventArgs e)
        {
            var id = cmbxWaiter.SelectedValue.ToString();
            TablsList table = new TablsList(compy, "change", lblTblID.Text, UsrID, this, UserObj, cmbxWaiter, id);
            this.Hide();
            table.Show();
        }

        private void metroButton4_Click(object sender, EventArgs e)
        {
            if (gridItems.SelectedRows.Count > 0)
            {
                EditBox edit = new EditBox("rate", gridItems, lblBal, UsrID, this);
                edit.Show();
            }
            else
            {
                MessageBox.Show("Item is Not Selected");
            }
        }

        private void metroButton5_Click(object sender, EventArgs e)
        {
            if (gridItems.SelectedRows.Count > 0)
            {
                EditBox edit = new EditBox("qty", gridItems, lblBal, UsrID, this);
                edit.Show();
            }
            else
            {
                MessageBox.Show("Item is Not Selected");
            }
        }

        private void metroTile1_Click(object sender, EventArgs e)
        {
            metroTile3.BackColor = System.Drawing.Color.Silver;
            metroTile1.BackColor = System.Drawing.Color.Brown;
            metroTile2.BackColor = System.Drawing.Color.Silver;
            metroTile4.BackColor = System.Drawing.Color.Silver;
            metroTile5.BackColor = System.Drawing.Color.Silver;
            pnlTab1.Visible = true;
            pnlTab2.Visible = false;
            takeAway = false;
            panel8.Visible = false;
            HomeDelivery = false;
            Express = false;
            DineIn = true;
            btnChangeTable.Enabled = true;
            btnTable.Enabled = true;
            cmbxItems.Visible = true;
            txtBarCode.Visible = true;
            button2.Visible = true;
            label34.Visible = true;
            txtAddress.Enabled = false;
            txtName.Enabled = false;
            txtMob.Enabled = false;
            CurrentBlock = "DineIn";
            label4.Text = "00";
            label33.Text = "DineIn";
            gridItems.Rows.Clear();

            if (lblTblID.Text == "0")
            {
                btnChangeTable.Enabled = false;
            }
            else
            {
                btnChangeTable.Enabled = true;
            }

            foreach (var control in panel4.Controls)
            {
                if (control is MetroButton)
                {
                    ((MetroButton)control).BackColor = System.Drawing.Color.DodgerBlue;
                }
            }
        }

        private void metroTile2_Click(object sender, EventArgs e)
        {
            metroTile3.BackColor = System.Drawing.Color.Silver;
            metroTile1.BackColor = System.Drawing.Color.Silver;
            metroTile2.BackColor = System.Drawing.Color.Brown;
            metroTile4.BackColor = System.Drawing.Color.Silver;
            metroTile5.BackColor = System.Drawing.Color.Silver;

            lblTableID.Text = "00";

            pnlTab2.Visible = true;
            pnlTab1.Visible = true;
            panel8.Visible = true;
            var list = new List<COA_M>();
            list.Add(new COA_M { CAC_Code = 1, CATitle = "%" });
            list.Add(new COA_M { CAC_Code = 2, CATitle = "Rs" });
            FillCombo<COA_M>(cmbxDis, list, "CATitle", "CAC_Code");
            FillCombo<COA_M>(cmbxGst, list, "CATitle", "CAC_Code");
            cmbxItems.Visible = false;
            button2.Visible = false;
            txtAddress.Enabled = false;
            txtBarCode.Visible = false;
            label34.Visible = false;
            txtName.Enabled = false;
            txtMob.Enabled = false;
            CurrentBlock = "DineInbilling";
            label33.Text = "DineInbilling";
            label4.Text = "00";
            generateChk();
        }

        private void generateChk()
        {
            var waiterList = db.tbl_Employee.AsNoTracking().Where(x => x.companyID == compy && x.isDeleted == false).ToList();
            waiterList.Insert(0, new tbl_Employee { ID = 0, EmployeName = "All" });
            cmbxDWaiter.DataSource = waiterList;
            cmbxDWaiter.DisplayMember = "EmployeName"; // Column Name
            cmbxDWaiter.ValueMember = "ID";  // Column Name
            cmbxDWaiter.SelectedIndex = 0;

            pnlChk.Controls.Clear();
            var TableList = db.tbl_Order.Where(x => x.isComplete == false && x.CompanyID == UserObj.AccessFailedCount).ToList();
            int locY = 43; // 73
            int TableLen = TableList.Count;

            for (int i = 0; i < TableLen; i++)
            {
                int ID = TableList[i].TblID ?? 0;
                var tableName = db.tbl_Table.Where(x => x.ID == ID && x.companyID == compy).FirstOrDefault().TableName;
                var checkBox1 = new RadioButton();
                checkBox1.AutoSize = true;
                checkBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
                checkBox1.Location = new System.Drawing.Point(13, locY);
                checkBox1.Name = ID.ToString();
                checkBox1.Size = new System.Drawing.Size(86, 19);
                checkBox1.TabIndex = 13;
                checkBox1.Text = tableName;
                checkBox1.UseVisualStyleBackColor = true;
                checkBox1.CheckedChanged += new System.EventHandler(CheckBoxCheckedChanged);
                pnlChk.Controls.Add(checkBox1);
                locY += 21;
            }
        }

        private void generateChk(int id)
        {

            pnlChk.Controls.Clear();
            var TableList = db.tbl_Order.Where(x => x.isComplete == false && x.CompanyID == UserObj.AccessFailedCount && x.WaiterID == id).ToList();
            int locY = 43; // 73
            int TableLen = TableList.Count;

            for (int i = 0; i < TableLen; i++)
            {
                int ID = TableList[i].TblID ?? 0;
                var tableName = db.tbl_Table.Where(x => x.ID == ID).FirstOrDefault().TableName;
                var checkBox1 = new RadioButton();
                checkBox1.AutoSize = true;
                checkBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
                checkBox1.Location = new System.Drawing.Point(13, locY);
                checkBox1.Name = ID.ToString();
                checkBox1.Size = new System.Drawing.Size(86, 19);
                checkBox1.TabIndex = 13;
                checkBox1.Text = tableName;
                checkBox1.UseVisualStyleBackColor = true;
                checkBox1.CheckedChanged += new System.EventHandler(CheckBoxCheckedChanged);
                pnlChk.Controls.Add(checkBox1);
                locY += 21;
            }
        }

        private void CheckBoxCheckedChanged(object sender, EventArgs e)
        {
            RadioButton checkbox = sender as RadioButton;
            gridInv.DataSource = null;
            gridInv.Rows.Clear();
            foreach (var control in pnlChk.Controls)
            {
                if (control is RadioButton)
                {
                    if (((RadioButton)control).Checked)
                    {
                        btnBillSave.Enabled = true;
                        break;
                    }
                }
            }

            var tblName = Convert.ToInt32(checkbox.Name);
            List<Orders> orders = (from order in db.tbl_Order
                                   join kot in db.tbl_KOT on order.OrderId.ToString() equals kot.OrderID
                                   join OrderDetails in db.tbl_OrderDetails on kot.Id.ToString() equals OrderDetails.KOTID
                                   join Items in db.Items on OrderDetails.itemID equals Items.IID
                                   where order.TblID == tblName && order.isComplete == false && order.CompanyID == compy
                                   select new Orders
                                   {
                                       OrderId = order.OrderId,
                                       OrderDetailId = OrderDetails.Id,
                                       OrderNo = order.OrderNo,
                                       TblID = order.TblID,
                                       item = Items.IName,
                                       ItemID = Items.IID,
                                       Qty = OrderDetails.Qty,
                                       Rate = OrderDetails.Rate,
                                       Amount = OrderDetails.Qty * OrderDetails.Rate,
                                       Discount = OrderDetails.disc,
                                       isComplete = order.isComplete,
                                       Total = order.Amount
                                   }).ToList();


            gridInv.DataSource = null;

            orders = (from x in orders
                      group x by x.item into y
                      select new Orders
                      {
                          item = y.Key,
                          OrderDetailId = y.First().OrderDetailId,
                          OrderId = y.First().OrderId,
                          OrderNo = y.First().OrderNo,
                          TblID = y.First().TblID,
                          ItemID = y.First().ItemID,
                          Rate = y.First().Rate,
                          Discount = y.Sum(z => z.Discount),
                          Amount = (y.Sum(z => z.Qty) * y.First().Rate) - y.Sum(z => z.Discount),
                          Total = y.Sum(z => z.Amount),
                          Qty = y.Sum(z => z.Qty)
                      }
              ).ToList();

            if (orders.Count > 0)
            {
                var listBinding = new BindingList<Orders>(orders);
                gridInv.DataSource = listBinding;
                txtGrandtotal.Text = (orders.Sum(x => x.Total) - orders.Sum(x => x.Discount)).ToString();
                lblBillNo.Text = orders[0].OrderNo.ToString();

                gridInv.Columns["OrderId"].Visible = false;
                gridInv.Columns["OrderNo"].Visible = false;
                gridInv.Columns["OrderDetailId"].Visible = false;
                gridInv.Columns["TblID"].Visible = false;
                gridInv.Columns["KOTID"].Visible = false;
                gridInv.Columns["OrderDate"].Visible = false;
                gridInv.Columns["isComplete"].Visible = false;
                gridInv.Columns["Tbl"].Visible = false;
                gridInv.Columns["WaiterID"].Visible = false;
                gridInv.Columns["booker"].Visible = false;
                gridInv.Columns["ItemID"].Visible = false;
                gridInv.Columns["CatID"].Visible = false;
                gridInv.Columns["RowHeight"].Visible = false;
                gridInv.Columns["Rows"].Visible = false;
                gridInv.Columns["CashCard"].Visible = false;
                gridInv.Columns["Gst"].Visible = false;
                gridInv.Columns["OrderType"].Visible = false;
                gridInv.Columns["ItemDetails"].Visible = false;
                gridInv.Columns["Address"].Visible = false;
                gridInv.Columns["Total"].Visible = false;

            }
            else
            {
                MessageBox.Show("No Item Found");
            }
        }

        public bool TableSelected(string TblClicked, string tblStat, string TblCurrent, string waiterID, ComboBox comboBox)
        {
            var tableID = Convert.ToInt32(TblClicked);
            var currTbl = Convert.ToInt32(TblCurrent);

            var Order = db.tbl_Order.Where(x => x.TblID == tableID && x.isComplete == false && x.CompanyID == UserObj.AccessFailedCount).FirstOrDefault();
            if (Order != null && tableID != currTbl && tblStat != "new")
            {
                MessageBox.Show("Reserved Table Cannot Be Selected !", "Table Cannot Changed", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            else if (tblStat == "change" && Order == null)
            {
                var Orders = db.tbl_Order.Where(x => x.TblID == currTbl && x.isComplete == false && x.CompanyID == UserObj.AccessFailedCount).FirstOrDefault();
                if (Orders != null)
                {
                    Orders.TblID = tableID;
                    db.Entry(Orders).State = EntityState.Modified;
                    db.SaveChanges();
                }
            }
            var tables = db.tbl_Table.Where(x => x.ID == tableID).FirstOrDefault();
            lblTableID.Text = tables.TableName;
            lblTblID.Text = TblClicked;
            //int waiterid = Convert.ToInt32(waiterID);
            //var vendor = db.tbl_Employee.Where(x => x.ID == waiterid).ToList();
            // FillCombo(comboBox, vendor, "EmployeName", "ID", 0);
            if (Order != null)
            {
                lblDineInID.Text = Order.OrderId.ToString();
                label4.Text = Order.OrderNo.ToString();
                comboBox.SelectedValue = Order.WaiterID;
            }
            else
            {
                lblDineInID.Text = "0";
                label4.Text = "";
                //comboBox.SelectedText = "irfan";
            }

            if (lblTblID.Text == "0")
            {
                btnChangeTable.Enabled = false;
            }
            else
            {
                btnChangeTable.Enabled = true;

            }
            return true;
        }

        private Control _focusedControl;
        private void TextBox_GotFocus(object sender, EventArgs e)
        {
            _focusedControl = (Control)sender;
        }
        private void metroButton19_Click(object sender, EventArgs e)
        {
            if (_focusedControl != null)
            {
                Button btn = sender as Button;
                if (btn.Text == "." && !_focusedControl.Text.Contains('.'))
                {
                    _focusedControl.Text += btn.Text;
                }
                if (btn.Text != ".")
                {
                    _focusedControl.Text += btn.Text;
                }
            }
        }
        private void metroTile4_Click(object sender, EventArgs e)
        {
            metroTile3.BackColor = System.Drawing.Color.Silver;
            metroTile1.BackColor = System.Drawing.Color.Silver;
            metroTile2.BackColor = System.Drawing.Color.Silver;
            metroTile4.BackColor = System.Drawing.Color.Brown;
            metroTile5.BackColor = System.Drawing.Color.Silver;
            lblTableID.Text = "00";
            CurrentBlock = "takeAway";
            label33.Text = "takeAway";
            pnlTab2.Visible = false;
            takeAway = true;
            panel8.Visible = false;
            HomeDelivery = false;
            Express = false;
            DineIn = false;
            btnChangeTable.Enabled = false;
            btnTable.Enabled = false;
            label34.Visible = true;
            cmbxItems.Visible = true;
            txtBarCode.Visible = true;
            button2.Visible = true;
            panel5.Controls.OfType<MetroButton>().ToList().ForEach(x => { if (x.TabIndex != 8) { x.Dispose(); } });
            panel5.Controls.OfType<Label>().ToList().ForEach(x => { if (x.TabIndex == 14) { x.Dispose(); } });
            pnlTab1.Visible = true;
            txtAddress.Enabled = false;
            txtName.Enabled = false;
            txtMob.Enabled = false;
            label23.Text = "Mobile #";
            label4.Text = "00";
            txtMob.Text = "";
            gridItems.Rows.Clear();

            foreach (var control in panel4.Controls)
            {
                if (control is MetroButton)
                {
                    ((MetroButton)control).BackColor = System.Drawing.Color.LimeGreen;
                }
            }
        }

        private void metroTile3_Click(object sender, EventArgs e)
        {
            metroTile3.BackColor = System.Drawing.Color.Gray;
            metroTile1.BackColor = System.Drawing.Color.Silver;
            metroTile2.BackColor = System.Drawing.Color.Silver;
            metroTile4.BackColor = System.Drawing.Color.Silver;
            metroTile5.BackColor = System.Drawing.Color.Silver;
            CurrentBlock = "Express";
            label33.Text = "Express";
            pnlTab2.Visible = false;
            takeAway = false;
            HomeDelivery = false;
            panel8.Visible = false;
            Express = true;
            DineIn = false;
            btnChangeTable.Enabled = false;
            btnTable.Enabled = false;
            txtBarCode.Visible = true;
            label34.Visible = true;
            cmbxItems.Visible = true;
            button2.Visible = true;
            //panel5.Controls.OfType<MetroButton>().ToList().ForEach(btn => btn.Dispose());
            panel5.Controls.OfType<MetroButton>().ToList().ForEach(x => { if (x.TabIndex != 8) { x.Dispose(); } });
            panel5.Controls.OfType<Label>().ToList().ForEach(x => { if (x.TabIndex == 14) { x.Dispose(); } });
            pnlTab1.Visible = true;
            txtAddress.Enabled = false;
            txtName.Enabled = false;
            txtMob.Enabled = true;
            label23.Text = "Vendor";
            label4.Text = "00";
            txtMob.Text = "FoodPanda";
            gridItems.Rows.Clear();

            foreach (var control in panel4.Controls)
            {
                if (control is MetroButton)
                {
                    ((MetroButton)control).BackColor = System.Drawing.Color.DarkKhaki;
                }
            }
        }

        private void metroTile5_Click(object sender, EventArgs e)
        {
            metroTile3.BackColor = System.Drawing.Color.Silver;
            metroTile1.BackColor = System.Drawing.Color.Silver;
            metroTile2.BackColor = System.Drawing.Color.Silver;
            metroTile4.BackColor = System.Drawing.Color.Silver;
            metroTile5.BackColor = System.Drawing.Color.Brown;
            lblTableID.Text = "00";
            CurrentBlock = "HomeDelivery";
            label33.Text = "HomeDelivery";
            pnlTab2.Visible = false;
            takeAway = false;
            HomeDelivery = true;
            panel8.Visible = false;
            Express = false;
            DineIn = false;
            btnChangeTable.Enabled = false;
            btnTable.Enabled = false;
            cmbxItems.Visible = true;
            button2.Visible = true;
            label34.Visible = true;
            txtBarCode.Visible = true;
            panel5.Controls.OfType<MetroButton>().ToList().ForEach(x => { if (x.TabIndex != 8) { x.Dispose(); } });
            panel5.Controls.OfType<Label>().ToList().ForEach(x => { if (x.TabIndex == 14) { x.Dispose(); } });
            pnlTab1.Visible = true;
            txtAddress.Enabled = true;
            txtName.Enabled = true;
            txtMob.Enabled = true;
            txtMob.Focus();
            label4.Text = "00";
            label23.Text = "Mobile #";
            txtMob.Text = "";
            gridItems.Rows.Clear();

            foreach (var control in panel4.Controls)
            {
                if (control is MetroButton)
                {
                    ((MetroButton)control).BackColor = System.Drawing.Color.DarkOrchid;
                }
            }
        }

        private void metroButton9_Click_1(object sender, EventArgs e)
        {
            var customer1 = db.Customers.AsNoTracking().Where(x => x.Cell == txtMob.Text && x.CompanyID == UserObj.AccessFailedCount).FirstOrDefault();
            if (customer1 == null)
            {
                // DataAccess access = new DataAccess();
                //customer = new Customer();
                //customer.Cell = txtMob.Text;
                //customer.CusName = txtName.Text;
                //customer.Add = txtAddress.Text;
                //db.Customers.Add(customer);

                //COA coa = new COA();

                //coa.AC_Code = 3;

                //con = new SqlConnection(ConnectionStrings.GetCS);
                //con.Open();
                //trans = con.BeginTransaction();
                //var code = access.GetScalar("GetAc_Code", coa, con, trans);

                //COA_D coaD = new COA_D();

                //coaD.CAC_Code = 3;
                ////   coaD.PType_ID = Convert.ToInt32(cmbCType.SelectedValue);//1;
                //coaD.ZID = 0;
                //coaD.AC_Title = txtName.Text.ToString();
                //coaD.DR = 0;
                //coaD.CR = 0;
                //coaD.Qty = 0;
                //coaD.InActive = false;//chkIsActive.Checked;

                //coaD.AC_Code = Convert.ToInt32(code);
                //db.COA_D.Add(coaD);

                //db.SaveChanges();

                //Customer customer = new Customer();

                //customer.AC_Code = Convert.ToInt32(code);
                //customer.CusName = txtName.Text;
                //customer.Cell = txtMob.Text;
                //db.Customers.Add(customer);
                //db.SaveChanges();

                //GL gl = new GL();

                //gl.RID = 0;
                //gl.RID2 = 0;
                //gl.TypeCode = 0;
                //gl.GLDate = dtCreatdDate.Value;
                //gl.AC_Code2 = 12000001;
                //gl.Narration = "Opening Entry";
                //gl.Debit = Convert.ToDouble(0);
                //gl.Credit = Convert.ToDouble(0);

                //gl.AC_Code = Convert.ToInt32(code);
                //db.GL.Add(gl);

                ////db.SaveChanges();

                //GL gl2 = new GL();

                //gl2.RID = 0;
                //gl2.RID2 = 0;
                //gl2.TypeCode = 0;
                //gl2.GLDate = dtCreatdDate.Value;
                //gl2.AC_Code = 12000001;
                //gl2.Narration = "Opening " + txtName.Text.Trim();
                //gl2.Debit = Convert.ToDouble(0);
                //gl2.Credit = Convert.ToDouble(0);

                //gl2.AC_Code2 = Convert.ToInt32(code);
                //db.GL.Add(gl2);

                //db.SaveChanges();
            }
            else
            {
                //customer1.CusName = txtName.Text;
                //customer1.Add = txtAddress.Text;
                //db.Entry(customer1).State = EntityState.Modified;
            }
            //db.SaveChanges();
            label30.Text = "1";//customer1.CID.ToString();
            savePrint("print");
            pnlTotal.Hide();
            btnSave.Enabled = true;
        }

        protected override bool ProcessCmdKey(ref Message msg, Keys keyData)
        {
            if (keyData == (Keys.Control | Keys.S))
            {
                if (pnlTab2.Visible)
                {
                    metroButton21_Click(null, null);
                }
                else
                {
                    if (btnSave.Enabled)
                    {
                        btnSave_Click(null, null);
                    }
                    else
                    {
                        metroButton9_Click_1(null, null);
                    }
                }
                return true;
            }
            if (keyData == (Keys.Enter) && txtBarCode.Text != "")
            {
                String id = txtBarCode.Text;
                var items = db.Items.Where(x => x.BarcodeNo == id && x.CompanyID == UserObj.AccessFailedCount).FirstOrDefault();
                if (items != null)
                {
                    AddSubQty(items.IID, 1, "inc", "", 0);
                    txtBarCode.Text = "";
                    txtBarCode.Focus();
                }
                else
                {
                    MessageBox.Show("Barcode Not Exists", "Barcode Not Exists");
                }
                return true;
            }
            if (keyData == (Keys.Control | Keys.P))
            {

            }
            if (keyData == (Keys.Control | Keys.Q))
            {

            }
            if (keyData == (Keys.Control | Keys.E))
            {

            }
            if (keyData == (Keys.Escape))
            {
                clear();
            }
            return base.ProcessCmdKey(ref msg, keyData);
        }

        private void textBo_Leave(object sender, EventArgs e)
        {
            textBoex.Text = CalculateDis(cmbxDis1.SelectedValue, txtGrandtotal1.Text, textBo.Text);
            txtNetAm.Text = NetAm().ToString();
            //txtCards2_Leave(null, null);
        }

        private void txtGstAmt2_Leave(object sender, EventArgs e)
        {
            txtGstTotl2.Text = CalculateDis(cmbxGst1.SelectedValue, txtGrandtotal1.Text, txtGstAmt2.Text);
            txtNetAm.Text = NetAm().ToString();
            //txtCards2_Leave(null, null);
        }

        private string CalculateDis(object type, string Total, string Amt)
        {
            var total = (Convert.ToDecimal(Total == "" ? "0" : Total));
            int typ = Convert.ToInt32(type);
            Amt = Amt.DefaultZero();
            if (typ == 1)
            {
                var perc = Convert.ToDecimal(Amt.DefaultZero());
                //total = total * Convert.ToDecimal("0." + perc.ToString());

                if (perc < 10)
                {
                    Amt = "0.0" + Amt;
                    total = total * Convert.ToDecimal(Amt);
                }
                else if (perc < 100 && perc > 9)
                {
                    Amt = "0." + Amt;
                    total = total * Convert.ToDecimal(Amt);
                }
                return String.Format("{0:0.00}", total);
            }
            else
            {
                return Amt == "" ? "0" : Amt;
            }
        }

        private void OnlyNum_KeyPress(object sender, KeyPressEventArgs e)
        {

            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) &&
        (e.KeyChar != '.'))
            {
                e.Handled = true;
            }

            // only allow one decimal point
            if ((e.KeyChar == '.') && ((sender as MetroFramework.Controls.MetroTextBox).Text.IndexOf('.') > -1))
            {
                e.Handled = true;
            }
        }
        private decimal NetAm()
        {
            return Convert.ToDecimal(txtGrandtotal1.Text.DefaultZero())
             +
             ((Convert.ToDecimal(txtGstTotl2.Text.DefaultZero())
             + Convert.ToDecimal(txtDelivery.Text.DefaultZero())) -
             Convert.ToDecimal(textBoex.Text.DefaultZero())
             );
        }

        private void txtCards2_Leave(object sender, EventArgs e)
        {
            //if (comboBox2.SelectedValue.ToString() == "1")
            //{
            //    txtCards2.Text = txtNetAm.Text;
            //}
            textBox52.Text =
                (Convert.ToDecimal(txtCards2.Text.DefaultZero())
                - (Convert.ToDecimal(txtGrandtotal1.Text.DefaultZero())
                +
                ((Convert.ToDecimal(txtGstTotl2.Text.DefaultZero())
                + Convert.ToDecimal(txtDelivery.Text.DefaultZero())) -
                Convert.ToDecimal(textBoex.Text.DefaultZero())
                )
                )
                ).ToString();
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

        private void metroButton20_Click(object sender, EventArgs e)
        {
            pnlTotal.Visible = false;
            btnSave.Enabled = true;
            foreach (var control in pnlTotal.Controls)
            {
                if (control is TextBox)
                {
                    ((TextBox)control).Text = "";
                }
            }
        }
        public void SilentPrint(int OrderId, bool type)
        {
            try
            {
                List<tbl_OrderDetails> list;
                ReportViewer reportViewer1 = new ReportViewer();

                var order = db.tbl_Order.Where(x => x.OrderId == OrderId).FirstOrDefault();
                if (type)
                {
                    list = db.tbl_OrderDetails.Where(x => x.OrderId == order.OrderId).ToList();
                }
                else
                {
                    list = db.tbl_OrderDetails.Where(x => x.OrderId == order.OrderId && x.KOTID == lblKOT.Text).ToList();
                }
                //var tbl = db.tbl_Table.Where(x => x.ID == order.TblID).FirstOrDefault();
                List<Orders> orderList = new List<Orders>();
                UserObj = UserObj == null ? new AspNetUsers() : UserObj;
                foreach (var item in list)
                {
                    Orders orders = new Orders();
                    orders.OrderId = order.OrderId;
                    orders.OrderDetailId = item.Id;
                    orders.KOTID = order.KOTID;
                    orders.OrderNo = order.OrderNo;
                    orders.OrderDate = order.OrderDate;
                    orders.isComplete = order.isComplete;
                    orders.Discount = order.Discount;
                    orders.Address = txtAddress.Text;
                    orders.Amount = order.Amount;
                    orders.ItemDetails = item.itemDtl;
                    orders.Total = item.Rate * item.Qty - item.disc;
                    orders.DiscountRs = item.disc;
                    orders.TblID = order.TblID;
                    orders.Gst = order.GST;
                    orders.waiterName = db.tbl_Employee.AsNoTracking().Where(x => x.ID == order.WaiterID).FirstOrDefault().EmployeName.ToString();
                    orders.OrderType = order.OrderType;
                    if (DineIn == true)
                    {
                        orders.Tbl = db.tbl_Table.Where(x => x.ID == order.TblID).FirstOrDefault().TableName;
                    }
                    orders.WaiterID = order.WaiterID;
                    orders.item = db.Items.Where(x => x.IID == item.itemID).FirstOrDefault().IName;
                    orders.booker = UserObj.UserName;
                    orders.CatID = item.CatID ?? 0;
                    orders.Cat = db.Items_Cat.Where(x => x.CatID == orders.CatID).FirstOrDefault().Cat;
                    orders.ItemID = item.itemID ?? 0;
                    orders.Qty = item.Qty;
                    orders.Rate = item.Rate;
                    orders.Client = @"\Img\123.png";
                    if (DineIn == true)
                    {
                        orders.CashCard = Convert.ToDecimal(txtCards.Text.DefaultZero());
                    }
                    else
                    {
                        orders.CashCard = Convert.ToDecimal(txtCards2.Text.DefaultZero());
                    }
                    orderList.Add(orders);
                }

                orderList.ForEach(x =>
                {
                    x.CatID = 1;
                    x.CompanyTitle = CompaniesModel.CompanyTitle;
                    x.CompanyPhone = CompaniesModel.CompanyPhone;
                    x.CompanyAddress = CompaniesModel.CompanyAddress;
                    //if (x.Cat.Contains("Bar B"))
                    //{
                    //    x.CatID = 1;
                    //}
                    //else
                    //{
                    //    x.CatID = 2;
                    //}
                });

                Silent silent = new Silent();
                if (type)
                {
                    //Printer.setDef(ConfigurationManager.AppSettings["Thermal"].ToString());
                    //silent.Run(reportViewer1, orderList, "SalesMngmt.Reporting.Definition.Recpt.rdlc");
                    silent.Run(reportViewer1, orderList, "SalesMngmt.Reporting.Definition.Print.rdlc");
                }
                else
                {
                    //Printer.setDef(ConfigurationManager.AppSettings["KOT"].ToString());
                    silent.Run(reportViewer1, orderList);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.InnerException.Message);
            }
        }

        public void SilentPrint(int OrderId)
        {
            try
            {
                List<tbl_OrderDetails> list;
                ReportViewer reportViewer1 = new ReportViewer();

                var order = db.tbl_Order.Where(x => x.OrderId == OrderId).FirstOrDefault();

                list = db.tbl_OrderDetails.Where(x => x.OrderId == order.OrderId).ToList();

                //var tbl = db.tbl_Table.Where(x => x.ID == order.TblID).FirstOrDefault();
                List<Orders> orderList = new List<Orders>();
                UserObj = UserObj == null ? new AspNetUsers() : UserObj;
                foreach (var item in list)
                {
                    Orders orders = new Orders();
                    orders.OrderId = order.OrderId;
                    orders.OrderDetailId = item.Id;
                    orders.KOTID = order.KOTID;
                    orders.OrderNo = order.OrderNo;
                    orders.OrderDate = order.OrderDate;
                    orders.isComplete = order.isComplete;
                    orders.Discount = order.Discount;
                    orders.Address = txtAddress.Text;
                    orders.Amount = order.Amount;
                    orders.ItemDetails = item.itemDtl;
                    orders.Total = item.Rate * item.Qty - item.disc;
                    orders.DiscountRs = item.disc;
                    orders.TblID = order.TblID;
                    orders.Gst = order.GST;
                    orders.OrderType = order.OrderType;

                    orders.Tbl = db.tbl_Table.Where(x => x.ID == order.TblID).FirstOrDefault().TableName;

                    orders.WaiterID = order.WaiterID;
                    orders.item = db.Items.Where(x => x.IID == item.itemID).FirstOrDefault().IName;
                    orders.booker = UserObj.UserName;
                    orders.CatID = item.CatID ?? 0;
                    orders.Cat = db.Items_Cat.Where(x => x.CatID == orders.CatID).FirstOrDefault().Cat;
                    orders.ItemID = item.itemID ?? 0;
                    orders.Qty = item.Qty;
                    orders.Rate = item.Rate;
                    orders.Client = @"\Img\123.png";
                    if (DineIn == true)
                    {
                        orders.CashCard = Convert.ToDecimal(txtCards.Text.DefaultZero());
                    }
                    else
                    {
                        orders.CashCard = Convert.ToDecimal(txtCards2.Text.DefaultZero());
                    }
                    orderList.Add(orders);
                }

                orderList.ForEach(x =>
                {
                    x.CatID = 1;
                    x.CompanyTitle = CompaniesModel.CompanyTitle;
                    x.CompanyPhone = CompaniesModel.CompanyPhone;
                    x.CompanyAddress = CompaniesModel.CompanyAddress;
                    //if (x.Cat.Contains("Bar B"))
                    //{
                    //    x.CatID = 1;
                    //}
                    //else
                    //{
                    //    x.CatID = 2;
                    //}
                });

                Silent silent = new Silent();

                //Printer.setDef(ConfigurationManager.AppSettings["Thermal"].ToString());
                //silent.Run(reportViewer1, orderList, "SalesMngmt.Reporting.Definition.Recpt.rdlc");
                silent.Run(reportViewer1, orderList, "SalesMngmt.Reporting.Definition.PrePayment.rdlc");


            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.InnerException.Message);
            }
        }

        public void SilentPrint(Orders Obj, bool type)
        {
            try
            {
                List<tbl_OrderDetails> list;
                ReportViewer reportViewer1 = new ReportViewer();

                var tbl = db.tbl_Table.Where(x => x.ID == Obj.TblID).FirstOrDefault();
                List<Orders> orderList = new List<Orders>();
                var order = Obj.Order;
                foreach (var item in Obj.OrderDetailsModel)
                {
                    Orders orders = new Orders();
                    orders.OrderId = order.OrderId;
                    orders.OrderDetailId = item.Id;
                    orders.KOTID = order.KOTID;
                    orders.OrderNo = order.OrderNo;
                    orders.OrderDate = order.OrderDate;
                    orders.isComplete = order.isComplete;
                    orders.Discount = order.Discount;
                    orders.Address = txtAddress.Text;
                    orders.Amount = order.Amount;
                    orders.DiscountRs = item.disc;
                    orders.ItemDetails = item.itemDtl;
                    orders.Total = item.Rate * item.Qty - item.disc;
                    orders.TblID = order.TblID;
                    orders.Gst = order.GST;
                    orders.OrderType = order.OrderType;
                    orders.DeliveryCharges = Convert.ToDecimal(txtDelivery.Text.DefaultZero());
                    if (tbl != null)
                    {
                        orders.Tbl = tbl.TableName;
                    }
                    orders.WaiterID = order.WaiterID;
                    var waiter = db.tbl_Employee.AsNoTracking().Where(x => x.ID == order.WaiterID).FirstOrDefault();
                    orders.waiterName = waiter.EmployeName;
                    orders.item = item.itemName; //db.Items.Where(x => x.IID == item.itemID).FirstOrDefault().IName;
                    orders.booker = UserObj.UserName;
                    orders.CatID = item.CatID ?? 0;
                    orders.Cat = db.Items_Cat.Where(x => x.CatID == orders.CatID).FirstOrDefault().Cat;
                    orders.ItemID = item.itemID ?? 0;
                    orders.Qty = item.Qty;
                    orders.Rate = item.Rate;
                    if (DineIn == true)
                    {
                        orders.CashCard = Convert.ToDecimal(txtCards.Text.DefaultZero());
                    }
                    else
                    {
                        orders.CashCard = Convert.ToDecimal(txtCards2.Text.DefaultZero());
                    }

                    orderList.Add(orders);
                }

                var Companies = new Companies().GetCompanyID(UserObj.AccessFailedCount);
                orderList.ForEach(x =>
                {
                    x.CatID = 1;
                    x.CompanyTitle = Companies.CompanyTitle;
                    x.CompanyPhone = Companies.CompanyPhone;
                    x.CompanyAddress = Companies.CompanyAddress;
                    //if (x.Cat.Contains("Bar B"))
                    //{
                    //    x.CatID = 1;
                    //}
                    //else
                    //{
                    //    x.CatID = 2;
                    //}
                });

                Silent silent = new Silent();
                if (type)
                {
                    silent.Run(reportViewer1, orderList, "SalesMngmt.Reporting.Definition.Print.rdlc");
                }
                else
                {
                    silent.Run(reportViewer1, orderList);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                //throw new Exception("Printer Is Not Connected or Connected On Wrong Usb Port . Please Change Usb Port and Try Again!");
            }
        }

        private void metroButton21_Click(object sender, EventArgs e)
        {
            if (gridInv.Rows.Count > 0)
            {
                Saves();
            }
        }

        private void Saves()
        {
            using (var transaction = db.Database.BeginTransaction())
            {
                try
                {
                    int orderID = 0;



                    foreach (DataGridViewRow row in gridInv.Rows)
                    {
                        orderID = Convert.ToInt32(row.Cells[0].Value.DefaultZero());
                        var OrderDetailId = Convert.ToInt32(row.Cells["OrderDetailId"].Value.DefaultZero());
                        tbl_OrderDetails OrderDetail = db.tbl_OrderDetails.Where(x => x.Id == OrderDetailId).FirstOrDefault();
                        // LedgerEntires(OrderDetail);
                    }
                    tbl_Order order = db.tbl_Order.Where(x => x.OrderId == orderID).FirstOrDefault();
                    order.isComplete = true;
                    order.Amount = Convert.ToDecimal(txtGrandtotal.Text);
                    order.Discount = Convert.ToDecimal(textBox7.Text.DefaultZero());
                    order.GST = Convert.ToDecimal(txtGstTotl.Text.DefaultZero());
                    order.KOTID = comboBox1.SelectedValue.ToString();
                    order.CompanyID = UserObj.AccessFailedCount;
                    order.OrderDate = dtCreatdDate.Value;
                    db.Entry(order).State = EntityState.Modified;
                    db.SaveChanges();
                    SilentPrint(orderID, true);
                    DineInEntry();
                    clear();
                    BindOrders();
                    generateChk();
                    transaction.Commit();
                    lblDineInID.Text = "0";

                }
                catch (Exception ex)
                {
                    //var exceptions = ExceptionExtensions.ToMessageAndCompleteStacktrace(ex);
                    //Lib.Entity.Excption Excepti = new Lib.Entity.Excption();
                    //Excepti.ExcptionName = exceptions;
                    //db.Excptions.Add(Excepti);
                    //db.SaveChanges();
                    transaction.Rollback();
                    MessageBox.Show(ex.Message);
                }
            }
        }

        private void DineInEntry()
        {
            foreach (DataGridViewRow row in gridInv.Rows)
            {
                if (row.Cells[0].Value != null)
                {

                    int Ridid = Convert.ToInt32(row.Cells["ItemID"].Value.DefaultZero());
                    int OrderId = Convert.ToInt32(row.Cells["OrderId"].Value.DefaultZero());
                    var item = db.Items.Where(x => x.IID == Ridid).FirstOrDefault();
                    var checkstock = db.Items.Where(x => x.IID == Ridid).FirstOrDefault();
                    if (checkstock.Inv_YN == false)
                    {
                        Itemledger ledger = new Itemledger();
                        ledger.RID = OrderId;
                        ledger.IID = Convert.ToInt32(row.Cells["ItemID"].Value.DefaultZero());
                        ledger.EDate = dtCreatdDate.Value;
                        // ledger.Bnid = BatchNo
                        ledger.TypeCode = 24;
                        ledger.AC_CODE = Convert.ToInt32(cmbxvendor.SelectedValue);

                        //jhjhjjjjjjjj

                        ledger.WID = (int)cmbxWarehouse1.SelectedValue;
                        //ledger.SID = (int)cmbxSaleMan.SelectedValue;


                        // ledger.SiD =
                        //    var ctnledger = Convert.ToDouble(item.CTN_PCK.DefaultZero()) * Convert.ToDouble(row.Cells[2].Value.DefaultZero());
                        //  ledger.CTN = Convert.ToDouble(row.Cells[2].Value.ToString());
                        ledger.PCS = Convert.ToDouble(row.Cells["Qty"].Value.ToString());
                        ledger.SJ = /*ctn +*/ Convert.ToDouble(row.Cells["Qty"].Value);
                        ledger.PurPrice = Convert.ToDouble(item.AveragePrice.DefaultZero());
                        ledger.SalesPriceP = Convert.ToDouble(row.Cells["Rate"].Value.ToString());//  ledger.Pamt = TotalAmount(pj * PurPrice)
                                                                                                  //  ledger.DisP = Convert.ToDouble(row.Cells["Amount"].Value.DefaultZero());
                                                                                                  //ledger.DisAmount = percentage in rupess
                                                                                                  // ledger.DisRs = Convert.ToDouble(row.Cells[5].Value.DefaultZero());
                        ledger.Amt = Convert.ToDouble(row.Cells["Rate"].Value.DefaultZero());
                        ledger.DisAmt = Convert.ToDouble(row.Cells["Discount"].Value.DefaultZero());
                        ledger.CompanyID = compy;

                        db.Itemledger.Add(ledger);
                        db.SaveChanges();

                        GL gl = new GL();
                        gl.RID = OrderId;
                        gl.TypeCode = 24;

                        // jhkjhkjh
                        //gl.SID = (int)cmbxSaleMan.SelectedValue;

                        gl.GLDate = dtCreatdDate.Value;
                        gl.IPrice = Convert.ToDouble(row.Cells["Rate"].Value.DefaultZero());
                        gl.AC_Code = Convert.ToInt32(cmbxvendor.SelectedValue);
                        gl.AC_Code2 = item.AC_Code_Inv;
                        //  gl.Narration = row.Cells[1].Value.ToString();
                        //  gl.MOP_ID = 2;
                        gl.Qty_Out = /*ctn +*/ Convert.ToDouble(row.Cells["Qty"].Value);
                        gl.PAmt = Convert.ToDouble(row.Cells["Rate"].Value.DefaultZero());
                        //gl.DisP = Convert.ToDouble(row.Cells["Amount"].Value ?? "0");
                        //gl.DisRs = Convert.ToDouble((row.Cells[7].Value ?? "0"));
                        gl.DisAmt = Convert.ToDouble(row.Cells["Discount"].Value.DefaultZero());//Convert.ToDouble(txtSaleRate.Text);
                        gl.Debit = Convert.ToDouble(row.Cells["Amount"].Value.DefaultZero());
                        gl.CompID = compy;
                        gl.Credit = 0;
                        db.GL.Add(gl);
                        db.SaveChanges();

                        GL gl1 = new GL();
                        gl1.RID = OrderId;
                        gl1.TypeCode = 24;
                        //kljlkj
                        //gl1.SID = (int)cmbxSaleMan.SelectedValue;
                        gl1.GLDate = dtCreatdDate.Value;
                        gl1.IPrice = item.AveragePrice;
                        gl1.AC_Code = item.AC_Code_Inv;
                        gl1.AC_Code2 = Convert.ToInt32(cmbxvendor.SelectedValue);
                        gl1.Narration = cmbxvendor.SelectedText;
                        //  gl.MOP_ID = 2;
                        gl1.Qty_Out = /*ctn +*/ Convert.ToDouble(row.Cells["Rate"].Value);
                        gl1.PAmt = Convert.ToDouble(item.AveragePrice.DefaultZero()) * (/*ctn +*/ Convert.ToDouble(row.Cells["Qty"].Value));//Convert.ToDouble(row.Cells[5].Value.DefaultZero());
                        gl1.DisP = 0;// Convert.ToDouble(row.Cells["Amount"].Value ?? "0");
                        gl1.DisRs = 0; //Convert.ToDouble((row.Cells[7].Value ?? "0"));
                        gl1.DisAmt = 0;// Convert.ToDouble(Convert.ToDouble(row.Cells["Amount"].Value.DefaultZero()) / 100 * Convert.ToDouble(row.Cells[5].Value.DefaultZero()));//Convert.ToDouble(txtSaleRate.Text);
                        gl1.Debit = 0;
                        gl1.Credit = Convert.ToDouble(item.AveragePrice.DefaultZero()) * (/*ctn +*/ Convert.ToDouble(row.Cells["Qty"].Value));
                        gl1.CompID = compy;
                        db.GL.Add(gl1);
                        db.SaveChanges();


                        GL gl2 = new GL();
                        gl2.RID = OrderId;
                        gl2.TypeCode = 24;
                        //  jkjhkjh
                        //gl2.SID = (int)cmbxSaleMan.SelectedValue;
                        gl2.GLDate = dtCreatdDate.Value;
                        gl2.IPrice = Convert.ToDouble(row.Cells["Rate"].Value.DefaultZero());
                        gl2.AC_Code = item.AC_Code_Inc;
                        gl2.AC_Code2 = Convert.ToInt32(cmbxvendor.SelectedValue);
                        gl2.Narration = cmbxvendor.SelectedText;
                        //  gl.MOP_ID = 2;
                        gl2.Qty_Out = /*ctn +*/ Convert.ToDouble(row.Cells["Qty"].Value);
                        gl2.PAmt = Convert.ToDouble(row.Cells["Rate"].Value.DefaultZero());
                        //gl2.DisP = Convert.ToDouble(row.Cells["Amount"].Value ?? "0");
                        //gl2.DisRs = Convert.ToDouble((row.Cells[7].Value ?? "0"));
                        gl2.DisAmt = Convert.ToDouble(row.Cells["Discount"].Value.DefaultZero());//Convert.ToDouble(txtSaleRate.Text);
                        gl2.Debit = 0;
                        gl2.Credit = Convert.ToDouble(row.Cells["Amount"].Value.DefaultZero());
                        gl2.CompID = compy;
                        db.GL.Add(gl2);
                        db.SaveChanges();

                        GL gl3 = new GL();
                        gl3.RID = OrderId;
                        gl3.TypeCode = 24;

                        //hjhkjhk
                        //gl3.SID = (int)cmbxSaleMan.SelectedValue;
                        gl3.GLDate = dtCreatdDate.Value;
                        gl3.IPrice = item.AveragePrice;
                        gl3.AC_Code = item.AC_Code_Cost;
                        gl3.AC_Code2 = Convert.ToInt32(cmbxvendor.SelectedValue);
                        gl3.Narration = cmbxvendor.SelectedText;
                        //  gl.MOP_ID = 2;
                        gl3.Qty_Out =/* ctn +*/ Convert.ToDouble(row.Cells["Qty"].Value);
                        gl3.PAmt = Convert.ToDouble(item.AveragePrice.DefaultZero()) * gl1.Qty_Out;//Convert.ToDouble(row.Cells[5].Value.DefaultZero());
                        gl3.DisP = 0;// Convert.ToDouble(row.Cells["Amount"].Value ?? "0");
                        gl3.DisRs = 0; //Convert.ToDouble((row.Cells[7].Value ?? "0"));
                        gl3.DisAmt = 0;// Convert.ToDouble(Convert.ToDouble(row.Cells["Amount"].Value.DefaultZero()) / 100 * Convert.ToDouble(row.Cells[5].Value.DefaultZero()));//Convert.ToDouble(txtSaleRate.Text);
                        gl3.Debit = Convert.ToDouble(item.AveragePrice.DefaultZero()) * gl1.Qty_Out; ;
                        gl3.Credit = 0;
                        gl3.CompID = compy;
                        db.GL.Add(gl3);
                        db.SaveChanges();
                    }
                    else
                    {
                        GL gl = new GL();
                        gl.RID = OrderId;
                        gl.TypeCode = 24;


                        // hjhkjh
                        //gl.SID = (int)cmbxSaleMan.SelectedValue;
                        gl.GLDate = dtCreatdDate.Value;
                        gl.IPrice = Convert.ToDouble(row.Cells["Rate"].Value.DefaultZero());
                        gl.AC_Code = Convert.ToInt32(cmbxvendor.SelectedValue);
                        gl.AC_Code2 = item.AC_Code_Inc;
                        gl.Narration = row.Cells["ItemId"].Value.ToString();
                        //  gl.MOP_ID = 2;
                        // var ctnledger = Convert.ToDouble(item.CTN_PCK.DefaultZero()) * Convert.ToDouble(row.Cells[2].Value.DefaultZero());
                        gl.Qty_Out = /*ctn +*/ Convert.ToDouble(row.Cells["Qty"].Value);
                        gl.PAmt = Convert.ToDouble(row.Cells["Rate"].Value.DefaultZero());
                        //gl.DisP = Convert.ToDouble(row.Cells["Amount"].Value ?? "0");
                        //gl.DisRs = Convert.ToDouble((row.Cells[7].Value ?? "0"));
                        gl.DisAmt = Convert.ToDouble(row.Cells["Discount"].Value.DefaultZero()); //Convert.ToDouble(txtSaleRate.Text);
                        gl.Debit = Convert.ToDouble(row.Cells["Amount"].Value.DefaultZero());
                        gl.Credit = 0;
                        gl.CompID = compy;
                        db.GL.Add(gl);
                        db.SaveChanges();

                        GL gl1 = new GL();
                        gl1.RID = OrderId;
                        gl1.TypeCode = 24;

                        //jhkjhjk
                        //gl1.SID = (int)cmbxSaleMan.SelectedValue;
                        gl1.GLDate = dtCreatdDate.Value;
                        gl1.IPrice = Convert.ToDouble(row.Cells["Rate"].Value.DefaultZero());
                        gl1.AC_Code = item.AC_Code_Inc;
                        gl1.AC_Code2 = Convert.ToInt32(cmbxvendor.SelectedValue);
                        gl1.Narration = cmbxvendor.SelectedText;
                        //  gl.MOP_ID = 2;
                        gl1.Qty_Out = /*ctn +*/ Convert.ToDouble(row.Cells["Rate"].Value);
                        gl1.PAmt = Convert.ToDouble(row.Cells["Rate"].Value.DefaultZero()) * Convert.ToDouble(row.Cells["Qty"].Value.DefaultZero());

                        gl1.DisAmt = Convert.ToDouble(row.Cells["Discount"].Value.DefaultZero());
                        gl1.Debit = 0;
                        gl1.Credit = Convert.ToDouble(row.Cells["Amount"].Value.DefaultZero());
                        gl1.CompID = compy;
                        db.GL.Add(gl1);
                        db.SaveChanges();



                        var recipe = db.tbl_Receipe.AsNoTracking().Where(x => x.compy == compy && x.isActive == false && x.ItemID == Ridid).ToList();

                        if (recipe == null)
                        {

                        }

                        else
                        {

                            foreach (var receipe in recipe)
                            {
                                var itemvalues = db.Items.AsNoTracking().Where(x => x.IID == receipe.RecipceItemId).FirstOrDefault();

                                Itemledger ledger = new Itemledger();
                                ledger.RID = OrderId;
                                ledger.IID = itemvalues.IID;
                                ledger.EDate = dtCreatdDate.Value;
                                // ledger.Bnid = BatchNo
                                ledger.TypeCode = 24;
                                ledger.AC_CODE = Convert.ToInt32(cmbxvendor.SelectedValue);

                                //jhjhjjjjjjjj

                                //ledger.WID = (int)cmbxWareHouse.SelectedValue;
                                //ledger.SID = (int)cmbxSaleMan.SelectedValue;


                                // ledger.SiD =
                                //    var ctnledger = Convert.ToDouble(item.CTN_PCK.DefaultZero()) * Convert.ToDouble(row.Cells[2].Value.DefaultZero());
                                //  ledger.CTN = Convert.ToDouble(row.Cells[2].Value.ToString());
                                ledger.PCS = Convert.ToDouble(receipe.qty);
                                ledger.SJ = Convert.ToDouble(receipe.qty);
                                ledger.PurPrice = Convert.ToDouble(itemvalues.AveragePrice.DefaultZero());
                                ledger.SalesPriceP = 0;//  ledger.Pamt = TotalAmount(pj * PurPrice)
                                                       //  ledger.DisP = Convert.ToDouble(row.Cells["Amount"].Value.DefaultZero());
                                                       //ledger.DisAmount = percentage in rupess
                                                       // ledger.DisRs = Convert.ToDouble(row.Cells[5].Value.DefaultZero());
                                ledger.Amt = 0;
                                ledger.DisAmt = 0;
                                ledger.CompanyID = compy;

                                db.Itemledger.Add(ledger);
                                db.SaveChanges();

                                GL glv = new GL();
                                glv.RID = OrderId;
                                glv.TypeCode = 24;

                                // jhkjhkjh
                                //gl.SID = (int)cmbxSaleMan.SelectedValue;

                                glv.GLDate = dtCreatdDate.Value;
                                glv.IPrice = 0;
                                glv.AC_Code = Convert.ToInt32(cmbxvendor.SelectedValue);
                                glv.AC_Code2 = itemvalues.AC_Code_Inv;
                                //  gl.Narration = row.Cells[1].Value.ToString();
                                //  gl.MOP_ID = 2;
                                glv.Qty_Out = /*ctn +*/ Convert.ToDouble(receipe.qty);
                                glv.PAmt = 0;
                                //gl.DisP = Convert.ToDouble(row.Cells["Amount"].Value ?? "0");
                                //gl.DisRs = Convert.ToDouble((row.Cells[7].Value ?? "0"));
                                glv.DisAmt = 0;//Convert.ToDouble(txtSaleRate.Text);
                                glv.Debit = 0;
                                glv.CompID = compy;
                                glv.Credit = 0;
                                db.GL.Add(glv);
                                db.SaveChanges();

                                GL glI = new GL();
                                glI.RID = OrderId;
                                glI.TypeCode = 24;
                                //kljlkj
                                //gl1.SID = (int)cmbxSaleMan.SelectedValue;
                                glI.GLDate = dtCreatdDate.Value;
                                glI.IPrice = Convert.ToDouble(itemvalues.AveragePrice.DefaultZero());
                                glI.AC_Code = itemvalues.AC_Code_Inv;
                                glI.AC_Code2 = Convert.ToInt32(cmbxvendor.SelectedValue);
                                glI.Narration = cmbxvendor.SelectedText;
                                //  gl.MOP_ID = 2;
                                glI.Qty_Out = /*ctn +*/ Convert.ToDouble(receipe.qty);
                                glI.PAmt = Convert.ToDouble(itemvalues.AveragePrice.DefaultZero()) * (/*ctn +*/ Convert.ToDouble(receipe.qty));//Convert.ToDouble(row.Cells[5].Value.DefaultZero());
                                glI.DisP = 0;// Convert.ToDouble(row.Cells["Amount"].Value ?? "0");
                                glI.DisRs = 0; //Convert.ToDouble((row.Cells[7].Value ?? "0"));
                                glI.DisAmt = 0;// Convert.ToDouble(Convert.ToDouble(row.Cells["Amount"].Value.DefaultZero()) / 100 * Convert.ToDouble(row.Cells[5].Value.DefaultZero()));//Convert.ToDouble(txtSaleRate.Text);
                                glI.Debit = 0;
                                glI.Credit = Convert.ToDouble(itemvalues.AveragePrice.DefaultZero()) * (/*ctn +*/Convert.ToDouble(receipe.qty));
                                glI.CompID = compy;
                                db.GL.Add(glI);
                                db.SaveChanges();


                                GL gl2 = new GL();
                                gl2.RID = OrderId;
                                gl2.TypeCode = 24;
                                //  jkjhkjh
                                //gl2.SID = (int)cmbxSaleMan.SelectedValue;
                                gl2.GLDate = dtCreatdDate.Value;
                                gl2.IPrice = 0;
                                gl2.AC_Code = itemvalues.AC_Code_Inc;
                                gl2.AC_Code2 = Convert.ToInt32(cmbxvendor.SelectedValue);
                                gl2.Narration = cmbxvendor.SelectedText;
                                //  gl.MOP_ID = 2;
                                gl2.Qty_Out = /*ctn +*/ Convert.ToDouble(receipe.qty);
                                gl2.PAmt = 0;
                                //gl2.DisP = Convert.ToDouble(row.Cells["Amount"].Value ?? "0");
                                //gl2.DisRs = Convert.ToDouble((row.Cells[7].Value ?? "0"));
                                gl2.DisAmt = 0;//Convert.ToDouble(txtSaleRate.Text);
                                gl2.Debit = 0;
                                gl2.Credit = 0;
                                gl2.CompID = compy;
                                db.GL.Add(gl2);
                                db.SaveChanges();

                                GL gl3 = new GL();
                                gl3.RID = OrderId;
                                gl3.TypeCode = 24;

                                //hjhkjhk
                                //gl3.SID = (int)cmbxSaleMan.SelectedValue;
                                gl3.GLDate = dtCreatdDate.Value;
                                gl3.IPrice = itemvalues.AveragePrice;
                                gl3.AC_Code = itemvalues.AC_Code_Cost;
                                gl3.AC_Code2 = Convert.ToInt32(cmbxvendor.SelectedValue);
                                gl3.Narration = cmbxvendor.SelectedText;
                                //  gl.MOP_ID = 2;
                                gl3.Qty_Out = Convert.ToDouble(receipe.qty);
                                gl3.PAmt = Convert.ToDouble(itemvalues.AveragePrice.DefaultZero()) * Convert.ToDouble(receipe.qty);//Convert.ToDouble(row.Cells[5].Value.DefaultZero());
                                gl3.DisP = 0;// Convert.ToDouble(row.Cells["Amount"].Value ?? "0");
                                gl3.DisRs = 0; //Convert.ToDouble((row.Cells[7].Value ?? "0"));
                                gl3.DisAmt = 0;// Convert.ToDouble(Convert.ToDouble(row.Cells["Amount"].Value.DefaultZero()) / 100 * Convert.ToDouble(row.Cells[5].Value.DefaultZero()));//Convert.ToDouble(txtSaleRate.Text);
                                gl3.Debit = Convert.ToDouble(itemvalues.AveragePrice.DefaultZero()) * Convert.ToDouble(receipe.qty);
                                gl3.Credit = 0;
                                gl3.CompID = compy;
                                db.GL.Add(gl3);
                                db.SaveChanges();


                            }
                        }
                        //
                    }

                }
            }
        }

        private void btnPnlSave_Click(object sender, EventArgs e)
        {
            savePrint("no");
            pnlTotal.Hide();
            btnSave.Enabled = true;
        }

        private void textBox2_Leave(object sender, EventArgs e)
        {
            textBox7.Text = CalculateDis(cmbxDis.SelectedValue, txtGrandtotal.Text, textBox2.Text);
            txtCards2_Leave(null, null);
        }

        private void txtGstAmt_Leave(object sender, EventArgs e)
        {
            txtGstTotl.Text = CalculateDis(cmbxGst.SelectedValue, txtGrandtotal.Text, txtGstAmt.Text);
            txtRec.Text = NetAmount().ToString();
            //txtCards2_Leave(null, null);
        }

        private Decimal NetAmount()
        {
            return Convert.ToDecimal(txtGrandtotal.Text.DefaultZero()) + (Convert.ToDecimal(txtGstTotl.Text.DefaultZero()) - Convert.ToDecimal(textBox7.Text.DefaultZero()));
        }

        private void txtCards_Leave(object sender, EventArgs e)
        {
            textBox5.Text =
                (Convert.ToDecimal(txtCards.Text == "" ? "0" : txtCards.Text)
                - (Convert.ToDecimal(txtGrandtotal.Text == "" ? "0" : txtGrandtotal.Text)
                +
                ((Convert.ToDecimal(txtGstTotl.Text == "" ? "0" : txtGstTotl.Text)) -
                Convert.ToDecimal(textBox7.Text == "" ? "0" : textBox7.Text)
                )
                )
                ).ToString();
        }

        private void metroButton6_Click(object sender, EventArgs e)
        {
            lblBal.Text = "0.0";
            gridItems.DataSource = null;
            gridItems.Rows.Clear();
        }

        private void metroButton12_Click(object sender, EventArgs e)
        {
            try
            {
                if (gridItems.CurrentCell != null)
                {
                    int selectedIndex = gridItems.CurrentCell.RowIndex;
                    if (selectedIndex > -1)
                    {
                        gridItems.Rows.RemoveAt(selectedIndex);
                        LoadBal();
                    }
                }
            }
            catch (InvalidOperationException ex)
            {
                //var exceptions = ExceptionExtensions.ToMessageAndCompleteStacktrace(ex);
                //Lib.Entity.Excption Excepti = new Lib.Entity.Excption();
                //Excepti.ExcptionName = exceptions;
                //db.Excptions.Add(Excepti);
                //db.SaveChanges();
                MessageBox.Show("Unable to remove selected row at this time");
            }
        }
        private void gridItems_CellEndEdit(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void metroButton3_Click(object sender, EventArgs e)
        {
            if (gridItems.SelectedRows.Count > 0)
            {
                var itemID = Convert.ToInt32(gridItems.SelectedRows[0].Cells[1].Value);
                AddSubQty(itemID, -1, "dec", "", "0");
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            var itmId = Convert.ToInt32(cmbxItems.SelectedValue);
            var itemList = db.Items.Where(x => x.IID == itmId).ToList();
            GenerateItems(itemList, false);
        }

        private void metroButton1_Click(object sender, EventArgs e)
        {
            if (gridItems.SelectedRows.Count > 0)
            {
                EditBox edit = new EditBox("Disc", gridItems, lblBal, UsrID, this);
                edit.Show();
            }
            else
            {
                MessageBox.Show("Item is Not Selected");
            }
        }

        private void metroButton15_Click(object sender, EventArgs e)
        {
            int IID = Convert.ToInt32(btnName);
            AddSubQty(IID, 1, "inc", "" + ddlpizzaSize.Text + " " + txtpizzaMore.Text, ddlpizzaSize.SelectedValue.ToString());
            panel7.Hide();
        }

        private void metroButton13_Click(object sender, EventArgs e)
        {
            panel7.Visible = false;
            metroButton15.Enabled = true;
            foreach (var control in panel7.Controls)
            {
                if (control is TextBox)
                {
                    ((TextBox)control).Text = "";
                }
            }
        }

        private void txtMob_Leave(object sender, EventArgs e)
        {
            int n;
            bool isNumeric = int.TryParse(txtMob.Text, out n);
            if (isNumeric)
            {
                string MobNum = txtMob.Text;
                var customer = db.Customers.Where(x => x.Cell == MobNum).FirstOrDefault();
                if (customer != null)
                {
                   // txtAddress.Text = customer.Add;
                   // txtName.Text = customer.CusName;
                }
            }
        }

        private void Pos_FormClosing(object sender, FormClosingEventArgs e)
        {
            //this.Dispose();
            //Main config = new Main(compy, UserObj);
            //config.Show();
        }


        private void comboBox1_Leave(object sender, EventArgs e)
        {
            if (comboBox1.SelectedValue.ToString() == "2")
            {
                txtCards.Text = (Convert.ToDecimal(txtGrandtotal.Text == "" ? "0" : txtGrandtotal.Text) + ((Convert.ToDecimal(txtGstTotl.Text == "" ? "0" : txtGstTotl.Text)) - Convert.ToDecimal(textBox7.Text == "" ? "0" : textBox7.Text))).ToString();
                txtCards_Leave(null, null);
                textBox5.Focus();
            }
        }

        private void comboBox2_Leave(object sender, EventArgs e)
        {
            if (cmbxPayment.SelectedValue.ToString() == "2")
            {
                txtCards2.Text = (Convert.ToDecimal(txtGrandtotal1.Text.DefaultZero()) + (Convert.ToDecimal(txtDelivery.Text.DefaultZero())) + ((Convert.ToDecimal(txtGstTotl2.Text.DefaultZero())) - Convert.ToDecimal(textBoex.Text.DefaultZero()))).ToString();
                txtCards2_Leave(null, null);
                textBox52.Focus();
            }
        }

        private void txtDelivery_Leave(object sender, EventArgs e)
        {
            txtNetAm.Text = NetAm().ToString();
        }

        private void metroButton14_Click_1(object sender, EventArgs e)
        {
            DialogResult dialogResult = MessageBox.Show("Are you sure You want to delete Complete Table", "Delete Table", MessageBoxButtons.YesNo);
            if (dialogResult == DialogResult.Yes)
            {
                if (gridInv.Rows.Count > 0)
                {
                    var orderID = Convert.ToInt32(gridInv.Rows[0].Cells[0].Value.DefaultZero());
                    db.tbl_Order.RemoveRange(db.tbl_Order.Where(x => x.OrderId == orderID));
                    db.tbl_OrderDetails.RemoveRange(db.tbl_OrderDetails.Where(x => x.OrderId == orderID));





                    db.Itemledger.RemoveRange(db.Itemledger.Where(x => x.RID == orderID && x.TypeCode == 24));
                    db.GL.RemoveRange(db.GL.Where(x => x.RID == orderID && x.TypeCode == 24));

                    db.SaveChanges();
                    db.SaveChanges();
                    //tbl_Order order = db.tbl_Order.Where(x => x.OrderId == orderID).FirstOrDefault();
                    //order.isComplete = true;
                    //order.Discount = 0;
                    //order.GST = 0;
                    //order.Amount = 0;
                    //order.KOTID = "2";
                    //order.OrderDate = dtCreatdDate.Value;
                    //db.Entry(order).State = EntityState.Modified;
                    //db.SaveChanges();
                    clear();
                    generateChk();
                    lblDineInID.Text = "0";
                }
            }
            else if (dialogResult == DialogResult.No)
            {
                //do something else
            }


        }

        private void metroButton7_Click(object sender, EventArgs e)
        {
            panel3.Visible = false;
            btnSave.Enabled = true;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Button btns = (Button)sender;
            var btn = btnName.Split('~');
            int IID = Convert.ToInt32(btn[0]);
            AddSubQty(IID, 1, "inc", btns.Text, 0);
            panel3.Hide();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Button btns = (Button)sender;
            var btn = btnName.Split('~');
            int IID = Convert.ToInt32(btn[0]);
            int FullPrice = Convert.ToInt32(btn[1]);
            AddSubQty(IID, 1, "inc", btns.Text, FullPrice);
            panel3.Hide();
        }

        private void metroButton8_Click(object sender, EventArgs e)
        {
            DialogResult dialogResult = MessageBox.Show("Are you are Delete Item", "Delete item", MessageBoxButtons.YesNo);
            if (dialogResult == DialogResult.Yes)
            {
                if (gridInv.SelectedRows.Count > 0)
                {
                    var ItemIDs = Convert.ToInt32(gridInv.SelectedRows[0].Cells["ItemID"].Value.DefaultZero());
                    var OrderN = gridInv.SelectedRows[0].Cells["OrderNo"].Value.ToString();
                    var OrderID = Convert.ToInt32(gridInv.SelectedRows[0].Cells["OrderID"].Value.DefaultZero());

                    if (gridInv.Rows.Count == 1)
                    {
                        db.tbl_Order.RemoveRange(db.tbl_Order.Where(x => x.OrderId == OrderID));
                        db.tbl_OrderDetails.RemoveRange(db.tbl_OrderDetails.Where(x => x.OrderId == OrderID));


                        db.Itemledger.RemoveRange(db.Itemledger.Where(x => x.RID == OrderID && x.TypeCode == 24));
                        db.GL.RemoveRange(db.GL.Where(x => x.RID == OrderID && x.TypeCode == 24));

                        db.SaveChanges();




                        //tbl_Order order = db.tbl_Order.Where(x => x.OrderNo == OrderN).FirstOrDefault();
                        //order.isComplete = true;
                        //order.Discount = 0;
                        //order.GST = 0;
                        //order.Amount = 0;
                        //order.KOTID = "2";
                        //order.OrderDate = dtCreatdDate.Value;
                        //db.Entry(order).State = EntityState.Modified;
                        //db.SaveChanges();
                        clear();
                        generateChk();
                        lblDineInID.Text = "0";
                        gridInv.Rows.Clear();
                    }
                    else
                    {
                        //       tbl_OrderDetails ordersDetl = (from order in db.tbl_Order
                        //                               join kot in db.tbl_KOT on order.OrderId.ToString() equals kot.OrderID
                        //                               join OrderDetails in db.tbl_OrderDetails on kot.Id.ToString() equals OrderDetails.KOTID
                        //                               where OrderDetails.itemID == ItemIDs && order.OrderNo == OrderN
                        //                               select new tbl_OrderDetails
                        //                               {
                        //                                   OrderId = OrderDetails.OrderId,
                        //                                   Rate = OrderDetails.Rate,
                        //                                   itemID = OrderDetails.itemID

                        //                               }).FirstOrDefault();

                        var ordersDetl = db.tbl_OrderDetails.Where(x => x.OrderId == OrderID && x.itemID == ItemIDs).FirstOrDefault();
                        //    db.tbl_OrderDetails.Attach(ordersDetl);
                        db.tbl_OrderDetails.RemoveRange(db.tbl_OrderDetails.Where(x => x.OrderId == OrderID && x.itemID == ItemIDs));
                        db.SaveChanges();
                        gridInv.Rows.RemoveAt(gridInv.SelectedRows[0].Index);

                        Decimal amt = 0;
                        foreach (DataGridViewRow row in gridInv.Rows)
                        {
                            amt += Convert.ToDecimal(row.Cells["Amount"].Value.DefaultZero()) - Convert.ToDecimal(row.Cells["Discount"].Value.DefaultZero());

                            // More code here

                        }
                        txtGrandtotal.Text = amt.ToString();
                        tbl_Order order = db.tbl_Order.Where(x => x.OrderNo == OrderN).FirstOrDefault();
                        // order.isComplete = true;
                        // order.Discount = 0;
                        // order.GST = 0;
                        order.Amount = amt;
                        //   order.KOTID = "2";
                        order.OrderDate = dtCreatdDate.Value;
                        db.Entry(order).State = EntityState.Modified;
                        db.SaveChanges();

                    }
                }
                else
                {
                    MessageBox.Show("Row is Not Selected!");
                }
            }
            else if (dialogResult == DialogResult.No)
            {
                //do something else
            }



        }

        private void metroButton10_Click_1(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void cmbxCus_SelectedIndexChanged(object sender, EventArgs e)
        {
            var dsa = Convert.ToInt32(cmbxCus.SelectedIndex);
            if (dsa >= 1)
            {
                int value = Convert.ToInt32(cmbxCus.SelectedValue);
                var vendor = db.COA_D.AsNoTracking().Where(x => x.CAC_Code == value && x.CompanyID == compy).ToList();
                FillCombo(cmbxvendor, vendor, "AC_Title", "AC_Code", 0);
            }
            else if (dsa == 0)
            {
                var vendor = db.COA_D.Where(x => x.CAC_Code == 1 && x.CompanyID == compy).ToList();
                FillCombo(cmbxvendor, vendor, "AC_Title", "CAC_Code", 0);
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            ItemSummary sum = new ItemSummary(compy,1);
            sum.Show();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            OrderSummaryForm inv = new OrderSummaryForm(UsrID, UserObj);
            inv.Show();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            DeleteOrders inv = new DeleteOrders(compy);
            inv.Show();
        }

        private void button7_Click(object sender, EventArgs e)
        {
            OrderDetailForm inv = new OrderDetailForm(UserObj);
            inv.Show();
        }

        private void button8_Click(object sender, EventArgs e)
        {
            var OrderID = Convert.ToInt32(cmbxOrders.SelectedValue);
            SilentPrint(OrderID, true);
        }

        private void BindOrders()
        {
            var orders = (from order in db.tbl_Order
                          select new Orders
                          {
                              OrderId = order.OrderId,
                              OrderNo = order.OrderNo,
                          }).OrderByDescending(x => x.OrderId).Take(20).ToList();

            FillCombo<Orders>(cmbxOrders, orders, "OrderNo", "OrderId");
        }

        private void cmbxDWaiter_SelectedValueChanged(object sender, EventArgs e)
        {



        }

        private void cmbxDWaiter_SelectedIndexChanged(object sender, EventArgs e)
        {
            var dsa = Convert.ToInt32(cmbxDWaiter.SelectedIndex);
            if (dsa >= 1)
            {
                int value = Convert.ToInt32(cmbxDWaiter.SelectedValue.ToString());
                generateChk(value);
            }

            else
            {
                generateChk();
            }





        }

        private void btnPreOrder_Click(object sender, EventArgs e)
        {
            if (gridInv.Rows.Count > 0)
            {



                int orderID = 0;
                foreach (DataGridViewRow row in gridInv.Rows)
                {
                    orderID = Convert.ToInt32(row.Cells[0].Value.DefaultZero());
                    var OrderDetailId = Convert.ToInt32(row.Cells["OrderDetailId"].Value.DefaultZero());
                    tbl_OrderDetails OrderDetail = db.tbl_OrderDetails.Where(x => x.Id == OrderDetailId).FirstOrDefault();
                    // LedgerEntires(OrderDetail);
                }
                tbl_Order order = db.tbl_Order.Where(x => x.OrderId == orderID).FirstOrDefault();
                //   order.isComplete = true;
                order.Amount = Convert.ToDecimal(txtGrandtotal.Text);
                order.Discount = Convert.ToDecimal(textBox7.Text.DefaultZero());
                order.GST = Convert.ToDecimal(txtGstTotl.Text.DefaultZero());
                order.KOTID = comboBox1.SelectedValue.ToString();
                order.CompanyID = UserObj.AccessFailedCount;
                order.OrderDate = dtCreatdDate.Value;

                SilentPrint(orderID);

            }
        }

        private void button9_Click(object sender, EventArgs e)
        {
            dueAmount dueAmount = new dueAmount(UserObj.AccessFailedCount);
            dueAmount.Show();
        }
    }
}

public class Dict
{
    public int key { get; set; }
    public String Value { get; set; }
}
