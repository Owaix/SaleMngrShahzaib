﻿using Lib.Entity;

namespace SalesMngmt.Configs
{
    partial class Coa
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle10 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle11 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle12 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Coa));
            this.metroPanel1 = new MetroFramework.Controls.MetroPanel();
            this.pnlMain = new MetroFramework.Controls.MetroPanel();
            this.label7 = new System.Windows.Forms.Label();
            this.txtQuantity = new MetroFramework.Controls.MetroTextBox();
            this.COABindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.label6 = new System.Windows.Forms.Label();
            this.txtCredit = new MetroFramework.Controls.MetroTextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.txtDebit = new MetroFramework.Controls.MetroTextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.cmbxCOA = new System.Windows.Forms.ComboBox();
            this.chkIsActive = new System.Windows.Forms.CheckBox();
            this.label2 = new System.Windows.Forms.Label();
            this.panel1 = new System.Windows.Forms.Panel();
            this.label3 = new System.Windows.Forms.Label();
            this.btnCancel = new MetroFramework.Controls.MetroButton();
            this.label1 = new System.Windows.Forms.Label();
            this.txtCOA = new MetroFramework.Controls.MetroTextBox();
            this.btnSave = new MetroFramework.Controls.MetroButton();
            this.COADataGridView = new MetroFramework.Controls.MetroGrid();
            this.aCCodeDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.aCTitleDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dRDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.cRDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.qtyDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.COABindingNavigator = new System.Windows.Forms.BindingNavigator(this.components);
            this.bindingNavigatorCountCOA = new System.Windows.Forms.ToolStripLabel();
            this.bindingNavigatorMoveFirstCOA = new System.Windows.Forms.ToolStripButton();
            this.bindingNavigatorMovePreviousCOA = new System.Windows.Forms.ToolStripButton();
            this.bindingNavigatorSeparator = new System.Windows.Forms.ToolStripSeparator();
            this.bindingNavigatorPositionCOA = new System.Windows.Forms.ToolStripTextBox();
            this.bindingNavigatorSeparator1 = new System.Windows.Forms.ToolStripSeparator();
            this.bindingNavigatorMoveNextCOA = new System.Windows.Forms.ToolStripButton();
            this.bindingNavigatorMoveLastCOA = new System.Windows.Forms.ToolStripButton();
            this.bindingNavigatorSeparator2 = new System.Windows.Forms.ToolStripSeparator();
            this.lblAdd = new System.Windows.Forms.ToolStripLabel();
            this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
            this.lblEdit = new System.Windows.Forms.ToolStripLabel();
            this.toolStripSeparator2 = new System.Windows.Forms.ToolStripSeparator();
            this.toolStripTextBoxFind = new System.Windows.Forms.ToolStripTextBox();
            this.toolStripButton1 = new System.Windows.Forms.ToolStripButton();
            this.toolStripSeparator3 = new System.Windows.Forms.ToolStripSeparator();
            this.toolStripLabel1 = new System.Windows.Forms.ToolStripLabel();
            this.ddlCOA = new System.Windows.Forms.ToolStripComboBox();
            this.metroPanel1.SuspendLayout();
            this.pnlMain.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.COABindingSource)).BeginInit();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.COADataGridView)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.COABindingNavigator)).BeginInit();
            this.COABindingNavigator.SuspendLayout();
            this.SuspendLayout();
            // 
            // metroPanel1
            // 
            this.metroPanel1.Controls.Add(this.pnlMain);
            this.metroPanel1.Controls.Add(this.COADataGridView);
            this.metroPanel1.Controls.Add(this.COABindingNavigator);
            this.metroPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.metroPanel1.HorizontalScrollbarBarColor = true;
            this.metroPanel1.HorizontalScrollbarHighlightOnWheel = false;
            this.metroPanel1.HorizontalScrollbarSize = 10;
            this.metroPanel1.Location = new System.Drawing.Point(20, 60);
            this.metroPanel1.Name = "metroPanel1";
            this.metroPanel1.Size = new System.Drawing.Size(760, 370);
            this.metroPanel1.TabIndex = 0;
            this.metroPanel1.VerticalScrollbarBarColor = true;
            this.metroPanel1.VerticalScrollbarHighlightOnWheel = false;
            this.metroPanel1.VerticalScrollbarSize = 10;
            // 
            // pnlMain
            // 
            this.pnlMain.BackColor = System.Drawing.Color.WhiteSmoke;
            this.pnlMain.Controls.Add(this.label7);
            this.pnlMain.Controls.Add(this.txtQuantity);
            this.pnlMain.Controls.Add(this.label6);
            this.pnlMain.Controls.Add(this.txtCredit);
            this.pnlMain.Controls.Add(this.label5);
            this.pnlMain.Controls.Add(this.txtDebit);
            this.pnlMain.Controls.Add(this.label4);
            this.pnlMain.Controls.Add(this.cmbxCOA);
            this.pnlMain.Controls.Add(this.chkIsActive);
            this.pnlMain.Controls.Add(this.label2);
            this.pnlMain.Controls.Add(this.panel1);
            this.pnlMain.Controls.Add(this.btnCancel);
            this.pnlMain.Controls.Add(this.label1);
            this.pnlMain.Controls.Add(this.txtCOA);
            this.pnlMain.Controls.Add(this.btnSave);
            this.pnlMain.HorizontalScrollbarBarColor = true;
            this.pnlMain.HorizontalScrollbarHighlightOnWheel = false;
            this.pnlMain.HorizontalScrollbarSize = 10;
            this.pnlMain.Location = new System.Drawing.Point(207, 39);
            this.pnlMain.Name = "pnlMain";
            this.pnlMain.Size = new System.Drawing.Size(369, 312);
            this.pnlMain.TabIndex = 5;
            this.pnlMain.UseCustomBackColor = true;
            this.pnlMain.VerticalScrollbarBarColor = true;
            this.pnlMain.VerticalScrollbarHighlightOnWheel = false;
            this.pnlMain.VerticalScrollbarSize = 10;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(15, 205);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(59, 15);
            this.label7.TabIndex = 18;
            this.label7.Text = "Quantity";
            // 
            // txtQuantity
            // 
            // 
            // 
            // 
            this.txtQuantity.CustomButton.Image = null;
            this.txtQuantity.CustomButton.Location = new System.Drawing.Point(209, 1);
            this.txtQuantity.CustomButton.Name = "";
            this.txtQuantity.CustomButton.Size = new System.Drawing.Size(21, 21);
            this.txtQuantity.CustomButton.Style = MetroFramework.MetroColorStyle.Blue;
            this.txtQuantity.CustomButton.TabIndex = 1;
            this.txtQuantity.CustomButton.Theme = MetroFramework.MetroThemeStyle.Light;
            this.txtQuantity.CustomButton.UseSelectable = true;
            this.txtQuantity.CustomButton.Visible = false;
            this.txtQuantity.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.COABindingSource, "Qty", true));
            this.txtQuantity.Lines = new string[0];
            this.txtQuantity.Location = new System.Drawing.Point(105, 201);
            this.txtQuantity.MaxLength = 32767;
            this.txtQuantity.Name = "txtQuantity";
            this.txtQuantity.PasswordChar = '\0';
            this.txtQuantity.ScrollBars = System.Windows.Forms.ScrollBars.None;
            this.txtQuantity.SelectedText = "";
            this.txtQuantity.SelectionLength = 0;
            this.txtQuantity.SelectionStart = 0;
            this.txtQuantity.ShortcutsEnabled = true;
            this.txtQuantity.Size = new System.Drawing.Size(231, 23);
            this.txtQuantity.TabIndex = 17;
            this.txtQuantity.UseSelectable = true;
            this.txtQuantity.WaterMarkColor = System.Drawing.Color.FromArgb(((int)(((byte)(109)))), ((int)(((byte)(109)))), ((int)(((byte)(109)))));
            this.txtQuantity.WaterMarkFont = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Pixel);
            this.txtQuantity.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtQuantity_KeyPress);
            // 
            // COABindingSource
            // 
            this.COABindingSource.DataSource = typeof(Lib.Entity.COA_D);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(15, 176);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(43, 15);
            this.label6.TabIndex = 16;
            this.label6.Text = "credit";
            // 
            // txtCredit
            // 
            // 
            // 
            // 
            this.txtCredit.CustomButton.Image = null;
            this.txtCredit.CustomButton.Location = new System.Drawing.Point(209, 1);
            this.txtCredit.CustomButton.Name = "";
            this.txtCredit.CustomButton.Size = new System.Drawing.Size(21, 21);
            this.txtCredit.CustomButton.Style = MetroFramework.MetroColorStyle.Blue;
            this.txtCredit.CustomButton.TabIndex = 1;
            this.txtCredit.CustomButton.Theme = MetroFramework.MetroThemeStyle.Light;
            this.txtCredit.CustomButton.UseSelectable = true;
            this.txtCredit.CustomButton.Visible = false;
            this.txtCredit.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.COABindingSource, "CR", true));
            this.txtCredit.Lines = new string[0];
            this.txtCredit.Location = new System.Drawing.Point(105, 172);
            this.txtCredit.MaxLength = 32767;
            this.txtCredit.Name = "txtCredit";
            this.txtCredit.PasswordChar = '\0';
            this.txtCredit.ScrollBars = System.Windows.Forms.ScrollBars.None;
            this.txtCredit.SelectedText = "";
            this.txtCredit.SelectionLength = 0;
            this.txtCredit.SelectionStart = 0;
            this.txtCredit.ShortcutsEnabled = true;
            this.txtCredit.Size = new System.Drawing.Size(231, 23);
            this.txtCredit.TabIndex = 15;
            this.txtCredit.UseSelectable = true;
            this.txtCredit.WaterMarkColor = System.Drawing.Color.FromArgb(((int)(((byte)(109)))), ((int)(((byte)(109)))), ((int)(((byte)(109)))));
            this.txtCredit.WaterMarkFont = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Pixel);
            this.txtCredit.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtCredit_KeyPress);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(15, 147);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(41, 15);
            this.label5.TabIndex = 14;
            this.label5.Text = "Debit";
            // 
            // txtDebit
            // 
            // 
            // 
            // 
            this.txtDebit.CustomButton.Image = null;
            this.txtDebit.CustomButton.Location = new System.Drawing.Point(209, 1);
            this.txtDebit.CustomButton.Name = "";
            this.txtDebit.CustomButton.Size = new System.Drawing.Size(21, 21);
            this.txtDebit.CustomButton.Style = MetroFramework.MetroColorStyle.Blue;
            this.txtDebit.CustomButton.TabIndex = 1;
            this.txtDebit.CustomButton.Theme = MetroFramework.MetroThemeStyle.Light;
            this.txtDebit.CustomButton.UseSelectable = true;
            this.txtDebit.CustomButton.Visible = false;
            this.txtDebit.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.COABindingSource, "DR", true));
            this.txtDebit.Lines = new string[0];
            this.txtDebit.Location = new System.Drawing.Point(105, 143);
            this.txtDebit.MaxLength = 32767;
            this.txtDebit.Name = "txtDebit";
            this.txtDebit.PasswordChar = '\0';
            this.txtDebit.ScrollBars = System.Windows.Forms.ScrollBars.None;
            this.txtDebit.SelectedText = "";
            this.txtDebit.SelectionLength = 0;
            this.txtDebit.SelectionStart = 0;
            this.txtDebit.ShortcutsEnabled = true;
            this.txtDebit.Size = new System.Drawing.Size(231, 23);
            this.txtDebit.TabIndex = 13;
            this.txtDebit.UseSelectable = true;
            this.txtDebit.WaterMarkColor = System.Drawing.Color.FromArgb(((int)(((byte)(109)))), ((int)(((byte)(109)))), ((int)(((byte)(109)))));
            this.txtDebit.WaterMarkFont = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Pixel);
            this.txtDebit.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtDebit_KeyPress);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(15, 83);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(57, 15);
            this.label4.TabIndex = 12;
            this.label4.Text = "Account";
            // 
            // cmbxCOA
            // 
            this.cmbxCOA.FormattingEnabled = true;
            this.cmbxCOA.Location = new System.Drawing.Point(105, 83);
            this.cmbxCOA.Name = "cmbxCOA";
            this.cmbxCOA.Size = new System.Drawing.Size(231, 21);
            this.cmbxCOA.TabIndex = 11;
            // 
            // chkIsActive
            // 
            this.chkIsActive.AutoSize = true;
            this.chkIsActive.DataBindings.Add(new System.Windows.Forms.Binding("Checked", this.COABindingSource, "InActive", true));
            this.chkIsActive.Location = new System.Drawing.Point(108, 237);
            this.chkIsActive.Name = "chkIsActive";
            this.chkIsActive.Size = new System.Drawing.Size(15, 14);
            this.chkIsActive.TabIndex = 10;
            this.chkIsActive.UseVisualStyleBackColor = true;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(15, 235);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(59, 15);
            this.label2.TabIndex = 9;
            this.label2.Text = "Is Active";
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.DodgerBlue;
            this.panel1.Controls.Add(this.label3);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(369, 62);
            this.panel1.TabIndex = 7;
            this.panel1.Paint += new System.Windows.Forms.PaintEventHandler(this.panel1_Paint);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 21.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.ForeColor = System.Drawing.Color.White;
            this.label3.Location = new System.Drawing.Point(127, 12);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(99, 33);
            this.label3.TabIndex = 0;
            this.label3.Text = "label3";
            // 
            // btnCancel
            // 
            this.btnCancel.BackColor = System.Drawing.Color.DodgerBlue;
            this.btnCancel.FontSize = MetroFramework.MetroButtonSize.Medium;
            this.btnCancel.ForeColor = System.Drawing.Color.White;
            this.btnCancel.Location = new System.Drawing.Point(193, 271);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(94, 32);
            this.btnCancel.TabIndex = 6;
            this.btnCancel.Text = "Cancel";
            this.btnCancel.Theme = MetroFramework.MetroThemeStyle.Dark;
            this.btnCancel.UseCustomBackColor = true;
            this.btnCancel.UseCustomForeColor = true;
            this.btnCancel.UseSelectable = true;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(15, 118);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(35, 15);
            this.label1.TabIndex = 5;
            this.label1.Text = "Title";
            // 
            // txtCOA
            // 
            // 
            // 
            // 
            this.txtCOA.CustomButton.Image = null;
            this.txtCOA.CustomButton.Location = new System.Drawing.Point(209, 1);
            this.txtCOA.CustomButton.Name = "";
            this.txtCOA.CustomButton.Size = new System.Drawing.Size(21, 21);
            this.txtCOA.CustomButton.Style = MetroFramework.MetroColorStyle.Blue;
            this.txtCOA.CustomButton.TabIndex = 1;
            this.txtCOA.CustomButton.Theme = MetroFramework.MetroThemeStyle.Light;
            this.txtCOA.CustomButton.UseSelectable = true;
            this.txtCOA.CustomButton.Visible = false;
            this.txtCOA.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.COABindingSource, "AC_Title", true));
            this.txtCOA.Lines = new string[0];
            this.txtCOA.Location = new System.Drawing.Point(105, 114);
            this.txtCOA.MaxLength = 32767;
            this.txtCOA.Name = "txtCOA";
            this.txtCOA.PasswordChar = '\0';
            this.txtCOA.ScrollBars = System.Windows.Forms.ScrollBars.None;
            this.txtCOA.SelectedText = "";
            this.txtCOA.SelectionLength = 0;
            this.txtCOA.SelectionStart = 0;
            this.txtCOA.ShortcutsEnabled = true;
            this.txtCOA.Size = new System.Drawing.Size(231, 23);
            this.txtCOA.TabIndex = 3;
            this.txtCOA.UseSelectable = true;
            this.txtCOA.WaterMarkColor = System.Drawing.Color.FromArgb(((int)(((byte)(109)))), ((int)(((byte)(109)))), ((int)(((byte)(109)))));
            this.txtCOA.WaterMarkFont = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Pixel);
            // 
            // btnSave
            // 
            this.btnSave.BackColor = System.Drawing.Color.DodgerBlue;
            this.btnSave.FontSize = MetroFramework.MetroButtonSize.Medium;
            this.btnSave.ForeColor = System.Drawing.Color.White;
            this.btnSave.Location = new System.Drawing.Point(93, 271);
            this.btnSave.Name = "btnSave";
            this.btnSave.Size = new System.Drawing.Size(94, 32);
            this.btnSave.TabIndex = 2;
            this.btnSave.Text = "Save";
            this.btnSave.Theme = MetroFramework.MetroThemeStyle.Dark;
            this.btnSave.UseCustomBackColor = true;
            this.btnSave.UseCustomForeColor = true;
            this.btnSave.UseSelectable = true;
            this.btnSave.Click += new System.EventHandler(this.btnSave_Click);
            // 
            // COADataGridView
            // 
            this.COADataGridView.AllowUserToAddRows = false;
            this.COADataGridView.AllowUserToDeleteRows = false;
            this.COADataGridView.AllowUserToResizeColumns = false;
            this.COADataGridView.AllowUserToResizeRows = false;
            this.COADataGridView.AutoGenerateColumns = false;
            this.COADataGridView.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.COADataGridView.BackgroundColor = System.Drawing.Color.White;
            this.COADataGridView.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.COADataGridView.CellBorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.None;
            this.COADataGridView.ColumnHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.None;
            dataGridViewCellStyle10.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle10.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle10.Font = new System.Drawing.Font("Book Antiqua", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle10.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle10.SelectionBackColor = System.Drawing.SystemColors.ActiveBorder;
            dataGridViewCellStyle10.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle10.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.COADataGridView.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle10;
            this.COADataGridView.ColumnHeadersHeight = 44;
            this.COADataGridView.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.aCCodeDataGridViewTextBoxColumn,
            this.aCTitleDataGridViewTextBoxColumn,
            this.dRDataGridViewTextBoxColumn,
            this.cRDataGridViewTextBoxColumn,
            this.qtyDataGridViewTextBoxColumn});
            this.COADataGridView.DataSource = this.COABindingSource;
            dataGridViewCellStyle11.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle11.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle11.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle11.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle11.SelectionBackColor = System.Drawing.Color.Tan;
            dataGridViewCellStyle11.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle11.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.COADataGridView.DefaultCellStyle = dataGridViewCellStyle11;
            this.COADataGridView.Dock = System.Windows.Forms.DockStyle.Fill;
            this.COADataGridView.EnableHeadersVisualStyles = false;
            this.COADataGridView.Font = new System.Drawing.Font("Segoe UI", 11F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.COADataGridView.GridColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(255)))));
            this.COADataGridView.Location = new System.Drawing.Point(0, 25);
            this.COADataGridView.MultiSelect = false;
            this.COADataGridView.Name = "COADataGridView";
            this.COADataGridView.ReadOnly = true;
            this.COADataGridView.RowHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.None;
            dataGridViewCellStyle12.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle12.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(174)))), ((int)(((byte)(219)))));
            dataGridViewCellStyle12.Font = new System.Drawing.Font("Segoe UI", 11F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            dataGridViewCellStyle12.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(255)))));
            dataGridViewCellStyle12.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(198)))), ((int)(((byte)(247)))));
            dataGridViewCellStyle12.SelectionForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(17)))), ((int)(((byte)(17)))), ((int)(((byte)(17)))));
            dataGridViewCellStyle12.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.COADataGridView.RowHeadersDefaultCellStyle = dataGridViewCellStyle12;
            this.COADataGridView.RowHeadersVisible = false;
            this.COADataGridView.RowHeadersWidthSizeMode = System.Windows.Forms.DataGridViewRowHeadersWidthSizeMode.DisableResizing;
            this.COADataGridView.RowTemplate.Height = 30;
            this.COADataGridView.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.COADataGridView.Size = new System.Drawing.Size(760, 345);
            this.COADataGridView.TabIndex = 3;
            // 
            // aCCodeDataGridViewTextBoxColumn
            // 
            this.aCCodeDataGridViewTextBoxColumn.DataPropertyName = "AC_Code";
            this.aCCodeDataGridViewTextBoxColumn.HeaderText = "Code";
            this.aCCodeDataGridViewTextBoxColumn.Name = "aCCodeDataGridViewTextBoxColumn";
            this.aCCodeDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // aCTitleDataGridViewTextBoxColumn
            // 
            this.aCTitleDataGridViewTextBoxColumn.DataPropertyName = "AC_Title";
            this.aCTitleDataGridViewTextBoxColumn.HeaderText = "Title";
            this.aCTitleDataGridViewTextBoxColumn.Name = "aCTitleDataGridViewTextBoxColumn";
            this.aCTitleDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // dRDataGridViewTextBoxColumn
            // 
            this.dRDataGridViewTextBoxColumn.DataPropertyName = "DR";
            this.dRDataGridViewTextBoxColumn.HeaderText = "Debit";
            this.dRDataGridViewTextBoxColumn.Name = "dRDataGridViewTextBoxColumn";
            this.dRDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // cRDataGridViewTextBoxColumn
            // 
            this.cRDataGridViewTextBoxColumn.DataPropertyName = "CR";
            this.cRDataGridViewTextBoxColumn.HeaderText = "Credit";
            this.cRDataGridViewTextBoxColumn.Name = "cRDataGridViewTextBoxColumn";
            this.cRDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // qtyDataGridViewTextBoxColumn
            // 
            this.qtyDataGridViewTextBoxColumn.DataPropertyName = "Qty";
            this.qtyDataGridViewTextBoxColumn.HeaderText = "Quantity";
            this.qtyDataGridViewTextBoxColumn.Name = "qtyDataGridViewTextBoxColumn";
            this.qtyDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // COABindingNavigator
            // 
            this.COABindingNavigator.AddNewItem = null;
            this.COABindingNavigator.BindingSource = this.COABindingSource;
            this.COABindingNavigator.CountItem = this.bindingNavigatorCountCOA;
            this.COABindingNavigator.DeleteItem = null;
            this.COABindingNavigator.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.bindingNavigatorMoveFirstCOA,
            this.bindingNavigatorMovePreviousCOA,
            this.bindingNavigatorSeparator,
            this.bindingNavigatorPositionCOA,
            this.bindingNavigatorCountCOA,
            this.bindingNavigatorSeparator1,
            this.bindingNavigatorMoveNextCOA,
            this.bindingNavigatorMoveLastCOA,
            this.bindingNavigatorSeparator2,
            this.lblAdd,
            this.toolStripSeparator1,
            this.lblEdit,
            this.toolStripSeparator2,
            this.toolStripTextBoxFind,
            this.toolStripButton1,
            this.toolStripSeparator3,
            this.toolStripLabel1,
            this.ddlCOA});
            this.COABindingNavigator.Location = new System.Drawing.Point(0, 0);
            this.COABindingNavigator.MoveFirstItem = this.bindingNavigatorMoveFirstCOA;
            this.COABindingNavigator.MoveLastItem = this.bindingNavigatorMoveLastCOA;
            this.COABindingNavigator.MoveNextItem = this.bindingNavigatorMoveNextCOA;
            this.COABindingNavigator.MovePreviousItem = this.bindingNavigatorMovePreviousCOA;
            this.COABindingNavigator.Name = "COABindingNavigator";
            this.COABindingNavigator.PositionItem = this.bindingNavigatorPositionCOA;
            this.COABindingNavigator.Size = new System.Drawing.Size(760, 25);
            this.COABindingNavigator.TabIndex = 4;
            this.COABindingNavigator.Text = "bindingNavigator1";
            // 
            // bindingNavigatorCountCOA
            // 
            this.bindingNavigatorCountCOA.Name = "bindingNavigatorCountCOA";
            this.bindingNavigatorCountCOA.Size = new System.Drawing.Size(35, 22);
            this.bindingNavigatorCountCOA.Text = "of {0}";
            this.bindingNavigatorCountCOA.ToolTipText = "Total number of COA";
            // 
            // bindingNavigatorMoveFirstCOA
            // 
            this.bindingNavigatorMoveFirstCOA.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.bindingNavigatorMoveFirstCOA.Name = "bindingNavigatorMoveFirstCOA";
            this.bindingNavigatorMoveFirstCOA.RightToLeftAutoMirrorImage = true;
            this.bindingNavigatorMoveFirstCOA.Size = new System.Drawing.Size(23, 22);
            this.bindingNavigatorMoveFirstCOA.Text = "Move first";
            // 
            // bindingNavigatorMovePreviousCOA
            // 
            this.bindingNavigatorMovePreviousCOA.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.bindingNavigatorMovePreviousCOA.Name = "bindingNavigatorMovePreviousCOA";
            this.bindingNavigatorMovePreviousCOA.RightToLeftAutoMirrorImage = true;
            this.bindingNavigatorMovePreviousCOA.Size = new System.Drawing.Size(23, 22);
            this.bindingNavigatorMovePreviousCOA.Text = "Move previous";
            // 
            // bindingNavigatorSeparator
            // 
            this.bindingNavigatorSeparator.Name = "bindingNavigatorSeparator";
            this.bindingNavigatorSeparator.Size = new System.Drawing.Size(6, 25);
            // 
            // bindingNavigatorPositionCOA
            // 
            this.bindingNavigatorPositionCOA.AccessibleName = "Position";
            this.bindingNavigatorPositionCOA.AutoSize = false;
            this.bindingNavigatorPositionCOA.Name = "bindingNavigatorPositionCOA";
            this.bindingNavigatorPositionCOA.Size = new System.Drawing.Size(50, 23);
            this.bindingNavigatorPositionCOA.Text = "0";
            this.bindingNavigatorPositionCOA.ToolTipText = "Current position";
            // 
            // bindingNavigatorSeparator1
            // 
            this.bindingNavigatorSeparator1.Name = "bindingNavigatorSeparator1";
            this.bindingNavigatorSeparator1.Size = new System.Drawing.Size(6, 25);
            // 
            // bindingNavigatorMoveNextCOA
            // 
            this.bindingNavigatorMoveNextCOA.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.bindingNavigatorMoveNextCOA.Name = "bindingNavigatorMoveNextCOA";
            this.bindingNavigatorMoveNextCOA.RightToLeftAutoMirrorImage = true;
            this.bindingNavigatorMoveNextCOA.Size = new System.Drawing.Size(23, 22);
            this.bindingNavigatorMoveNextCOA.Text = "Move next";
            // 
            // bindingNavigatorMoveLastCOA
            // 
            this.bindingNavigatorMoveLastCOA.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.bindingNavigatorMoveLastCOA.Name = "bindingNavigatorMoveLastCOA";
            this.bindingNavigatorMoveLastCOA.RightToLeftAutoMirrorImage = true;
            this.bindingNavigatorMoveLastCOA.Size = new System.Drawing.Size(23, 22);
            this.bindingNavigatorMoveLastCOA.Text = "Move last";
            // 
            // bindingNavigatorSeparator2
            // 
            this.bindingNavigatorSeparator2.Name = "bindingNavigatorSeparator2";
            this.bindingNavigatorSeparator2.Size = new System.Drawing.Size(6, 25);
            // 
            // lblAdd
            // 
            this.lblAdd.Name = "lblAdd";
            this.lblAdd.Size = new System.Drawing.Size(29, 22);
            this.lblAdd.Text = "Add";
            this.lblAdd.Click += new System.EventHandler(this.lblAdd_Click);
            // 
            // toolStripSeparator1
            // 
            this.toolStripSeparator1.Name = "toolStripSeparator1";
            this.toolStripSeparator1.Size = new System.Drawing.Size(6, 25);
            // 
            // lblEdit
            // 
            this.lblEdit.Name = "lblEdit";
            this.lblEdit.Size = new System.Drawing.Size(27, 22);
            this.lblEdit.Text = "Edit";
            this.lblEdit.Click += new System.EventHandler(this.lblEdit_Click);
            // 
            // toolStripSeparator2
            // 
            this.toolStripSeparator2.Name = "toolStripSeparator2";
            this.toolStripSeparator2.Size = new System.Drawing.Size(6, 25);
            // 
            // toolStripTextBoxFind
            // 
            this.toolStripTextBoxFind.Name = "toolStripTextBoxFind";
            this.toolStripTextBoxFind.Size = new System.Drawing.Size(100, 25);
            this.toolStripTextBoxFind.Leave += new System.EventHandler(this.toolStripTextBoxFind_Leave);
            // 
            // toolStripButton1
            // 
            this.toolStripButton1.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripButton1.Image = ((System.Drawing.Image)(resources.GetObject("toolStripButton1.Image")));
            this.toolStripButton1.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton1.Name = "toolStripButton1";
            this.toolStripButton1.Size = new System.Drawing.Size(23, 22);
            // 
            // toolStripSeparator3
            // 
            this.toolStripSeparator3.Name = "toolStripSeparator3";
            this.toolStripSeparator3.Size = new System.Drawing.Size(6, 25);
            // 
            // toolStripLabel1
            // 
            this.toolStripLabel1.Name = "toolStripLabel1";
            this.toolStripLabel1.Size = new System.Drawing.Size(32, 22);
            this.toolStripLabel1.Text = "COA";
            // 
            // ddlCOA
            // 
            this.ddlCOA.Name = "ddlCOA";
            this.ddlCOA.Size = new System.Drawing.Size(121, 25);
            this.ddlCOA.SelectedIndexChanged += new System.EventHandler(this.ddlCOA_SelectedIndexChanged);
            // 
            // Coa
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.metroPanel1);
            this.Name = "Coa";
            this.Text = "COA";
            this.Load += new System.EventHandler(this.COA_Load);
            this.metroPanel1.ResumeLayout(false);
            this.metroPanel1.PerformLayout();
            this.pnlMain.ResumeLayout(false);
            this.pnlMain.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.COABindingSource)).EndInit();
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.COADataGridView)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.COABindingNavigator)).EndInit();
            this.COABindingNavigator.ResumeLayout(false);
            this.COABindingNavigator.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private MetroFramework.Controls.MetroPanel metroPanel1;
        private MetroFramework.Controls.MetroGrid COADataGridView;
        //private System.Windows.Forms.DataGridView COADataGridView;
        private System.Windows.Forms.BindingNavigator COABindingNavigator;
        private System.Windows.Forms.ToolStripLabel bindingNavigatorCountCOA;
        private System.Windows.Forms.ToolStripButton bindingNavigatorMoveFirstCOA;
        private System.Windows.Forms.ToolStripButton bindingNavigatorMovePreviousCOA;
        private System.Windows.Forms.ToolStripSeparator bindingNavigatorSeparator;
        private System.Windows.Forms.ToolStripTextBox bindingNavigatorPositionCOA;
        private System.Windows.Forms.ToolStripSeparator bindingNavigatorSeparator1;
        private System.Windows.Forms.ToolStripButton bindingNavigatorMoveNextCOA;
        private System.Windows.Forms.ToolStripButton bindingNavigatorMoveLastCOA;
        private System.Windows.Forms.ToolStripSeparator bindingNavigatorSeparator2;
        private System.Windows.Forms.ToolStripLabel lblAdd;
        private System.Windows.Forms.ToolStripLabel lblEdit;
        private MetroFramework.Controls.MetroPanel pnlMain;
        private MetroFramework.Controls.MetroButton btnSave;
        private MetroFramework.Controls.MetroTextBox txtCOA;
        private System.Windows.Forms.Label label1;
        private MetroFramework.Controls.MetroButton btnCancel;
        public System.Windows.Forms.BindingSource COABindingSource;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.CheckBox chkIsActive;
        private System.Windows.Forms.DataGridViewTextBoxColumn COADataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn isDeletedDataGridViewTextBoxColumn;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator1;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator2;
        private System.Windows.Forms.ToolStripTextBox toolStripTextBoxFind;
        private System.Windows.Forms.ToolStripButton toolStripButton1;
        private System.Windows.Forms.DataGridViewTextBoxColumn iCOA1DataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn activeDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn ICOA;
        private System.Windows.Forms.DataGridViewTextBoxColumn mACCodeDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn mTitleDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn subACCodeDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn subTitleDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn cATitleDataGridViewTextBoxColumn;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator3;
        private System.Windows.Forms.ToolStripComboBox ddlCOA;
        private System.Windows.Forms.ToolStripLabel toolStripLabel1;
        private System.Windows.Forms.DataGridViewTextBoxColumn aCCodeDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn aCTitleDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn dRDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn cRDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn qtyDataGridViewTextBoxColumn;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.ComboBox cmbxCOA;
        private System.Windows.Forms.Label label7;
        private MetroFramework.Controls.MetroTextBox txtQuantity;
        private System.Windows.Forms.Label label6;
        private MetroFramework.Controls.MetroTextBox txtCredit;
        private System.Windows.Forms.Label label5;
        private MetroFramework.Controls.MetroTextBox txtDebit;
    }
}