namespace SalesMngmt.Reporting
{
    partial class RecAmtbySR
    {
        /// <summary>

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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            this.metroPanel1 = new MetroFramework.Controls.MetroPanel();
            this.label1 = new System.Windows.Forms.Label();
            this.CategorysDataGridView = new System.Windows.Forms.DataGridView();
            this.sizeBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.colorBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.CategoryBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.recivedVoucharIndexResultBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.spgetArticleResultBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.articleTypeBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.styleBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.label10 = new System.Windows.Forms.Label();
            this.cmbxCustomer = new MetroFramework.Controls.MetroComboBox();
            this.btnSearch = new MetroFramework.Controls.MetroButton();
            this.panel1 = new System.Windows.Forms.Panel();
            this.cmbxSalesPerson = new MetroFramework.Controls.MetroComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.Reference = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.SNO = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Date = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Debit = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.metroPanel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.CategorysDataGridView)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.sizeBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.colorBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.CategoryBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.recivedVoucharIndexResultBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.spgetArticleResultBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.articleTypeBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.styleBindingSource)).BeginInit();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // metroPanel1
            // 
            this.metroPanel1.Controls.Add(this.label1);
            this.metroPanel1.Controls.Add(this.CategorysDataGridView);
            this.metroPanel1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.metroPanel1.HorizontalScrollbarBarColor = true;
            this.metroPanel1.HorizontalScrollbarHighlightOnWheel = false;
            this.metroPanel1.HorizontalScrollbarSize = 12;
            this.metroPanel1.Location = new System.Drawing.Point(0, 102);
            this.metroPanel1.Margin = new System.Windows.Forms.Padding(4);
            this.metroPanel1.Name = "metroPanel1";
            this.metroPanel1.Size = new System.Drawing.Size(1250, 471);
            this.metroPanel1.TabIndex = 0;
            this.metroPanel1.VerticalScrollbarBarColor = true;
            this.metroPanel1.VerticalScrollbarHighlightOnWheel = false;
            this.metroPanel1.VerticalScrollbarSize = 13;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.White;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(655, 518);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(0, 18);
            this.label1.TabIndex = 60;
            // 
            // CategorysDataGridView
            // 
            this.CategorysDataGridView.AllowUserToAddRows = false;
            this.CategorysDataGridView.AllowUserToDeleteRows = false;
            this.CategorysDataGridView.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.CategorysDataGridView.BackgroundColor = System.Drawing.SystemColors.ButtonHighlight;
            this.CategorysDataGridView.ClipboardCopyMode = System.Windows.Forms.DataGridViewClipboardCopyMode.Disable;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F);
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.CategorysDataGridView.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.CategorysDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.CategorysDataGridView.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Reference,
            this.SNO,
            this.Date,
            this.Debit,
            this.Column1});
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle2.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.Color.Tan;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.CategorysDataGridView.DefaultCellStyle = dataGridViewCellStyle2;
            this.CategorysDataGridView.Dock = System.Windows.Forms.DockStyle.Fill;
            this.CategorysDataGridView.EnableHeadersVisualStyles = false;
            this.CategorysDataGridView.Location = new System.Drawing.Point(0, 0);
            this.CategorysDataGridView.Margin = new System.Windows.Forms.Padding(4);
            this.CategorysDataGridView.Name = "CategorysDataGridView";
            this.CategorysDataGridView.ReadOnly = true;
            this.CategorysDataGridView.RowHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.None;
            this.CategorysDataGridView.RowHeadersVisible = false;
            this.CategorysDataGridView.RowHeadersWidthSizeMode = System.Windows.Forms.DataGridViewRowHeadersWidthSizeMode.AutoSizeToFirstHeader;
            this.CategorysDataGridView.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.CategorysDataGridView.Size = new System.Drawing.Size(1250, 471);
            this.CategorysDataGridView.TabIndex = 6;
            this.CategorysDataGridView.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.CategorysDataGridView_CellClick);
            this.CategorysDataGridView.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.CategorysDataGridView_CellContentClick);
            // 
            // sizeBindingSource
            // 
            this.sizeBindingSource.DataSource = typeof(Lib.Entity.Sizes);
            // 
            // colorBindingSource
            // 
            this.colorBindingSource.DataSource = typeof(Lib.Entity.Colors);
            // 
            // CategoryBindingSource
            // 
            this.CategoryBindingSource.DataSource = typeof(Lib.Entity.Items_Cat);
            // 
            // recivedVoucharIndexResultBindingSource
            // 
            this.recivedVoucharIndexResultBindingSource.DataSource = typeof(Lib.Entity.RecivedVoucharIndex_Result);
            // 
            // spgetArticleResultBindingSource
            // 
            this.spgetArticleResultBindingSource.DataSource = typeof(Lib.Entity.sp_getArticle_Result);
            // 
            // articleTypeBindingSource
            // 
            this.articleTypeBindingSource.DataSource = typeof(Lib.Entity.ArticleTypes);
            // 
            // styleBindingSource
            // 
            this.styleBindingSource.DataSource = typeof(Lib.Entity.Styles);
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.BackColor = System.Drawing.Color.White;
            this.label10.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label10.Location = new System.Drawing.Point(452, 42);
            this.label10.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(82, 18);
            this.label10.TabIndex = 58;
            this.label10.Text = "Customer";
            // 
            // cmbxCustomer
            // 
            this.cmbxCustomer.FormattingEnabled = true;
            this.cmbxCustomer.ItemHeight = 24;
            this.cmbxCustomer.Location = new System.Drawing.Point(543, 36);
            this.cmbxCustomer.Margin = new System.Windows.Forms.Padding(4);
            this.cmbxCustomer.Name = "cmbxCustomer";
            this.cmbxCustomer.Size = new System.Drawing.Size(203, 30);
            this.cmbxCustomer.TabIndex = 59;
            this.cmbxCustomer.UseSelectable = true;
            // 
            // btnSearch
            // 
            this.btnSearch.BackColor = System.Drawing.Color.DodgerBlue;
            this.btnSearch.FontSize = MetroFramework.MetroButtonSize.Medium;
            this.btnSearch.ForeColor = System.Drawing.Color.White;
            this.btnSearch.Location = new System.Drawing.Point(1096, 36);
            this.btnSearch.Margin = new System.Windows.Forms.Padding(4);
            this.btnSearch.Name = "btnSearch";
            this.btnSearch.Size = new System.Drawing.Size(125, 39);
            this.btnSearch.TabIndex = 14;
            this.btnSearch.Text = "Search";
            this.btnSearch.Theme = MetroFramework.MetroThemeStyle.Dark;
            this.btnSearch.UseCustomBackColor = true;
            this.btnSearch.UseCustomForeColor = true;
            this.btnSearch.UseSelectable = true;
            this.btnSearch.Click += new System.EventHandler(this.btnSearch_Click);
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.cmbxSalesPerson);
            this.panel1.Controls.Add(this.label2);
            this.panel1.Controls.Add(this.btnSearch);
            this.panel1.Controls.Add(this.cmbxCustomer);
            this.panel1.Controls.Add(this.label10);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(1250, 103);
            this.panel1.TabIndex = 61;
            // 
            // cmbxSalesPerson
            // 
            this.cmbxSalesPerson.FormattingEnabled = true;
            this.cmbxSalesPerson.ItemHeight = 24;
            this.cmbxSalesPerson.Location = new System.Drawing.Point(170, 36);
            this.cmbxSalesPerson.Margin = new System.Windows.Forms.Padding(4);
            this.cmbxSalesPerson.Name = "cmbxSalesPerson";
            this.cmbxSalesPerson.Size = new System.Drawing.Size(203, 30);
            this.cmbxSalesPerson.TabIndex = 61;
            this.cmbxSalesPerson.UseSelectable = true;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.Color.White;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(49, 42);
            this.label2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(109, 18);
            this.label2.TabIndex = 60;
            this.label2.Text = "Sales Person";
            // 
            // Reference
            // 
            this.Reference.DataPropertyName = "AC_Code";
            this.Reference.HeaderText = "Code";
            this.Reference.Name = "Reference";
            this.Reference.ReadOnly = true;
            // 
            // SNO
            // 
            this.SNO.DataPropertyName = "CusName";
            this.SNO.HeaderText = "Customer";
            this.SNO.Name = "SNO";
            this.SNO.ReadOnly = true;
            // 
            // Date
            // 
            this.Date.DataPropertyName = "CityName";
            this.Date.HeaderText = "City";
            this.Date.Name = "Date";
            this.Date.ReadOnly = true;
            // 
            // Debit
            // 
            this.Debit.DataPropertyName = "Amt";
            this.Debit.HeaderText = "Rec Amount";
            this.Debit.Name = "Debit";
            this.Debit.ReadOnly = true;
            // 
            // Column1
            // 
            this.Column1.DataPropertyName = "balance";
            this.Column1.HeaderText = "Balance";
            this.Column1.Name = "Column1";
            this.Column1.ReadOnly = true;
            // 
            // RecAmtbySR
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1250, 573);
            this.Controls.Add(this.metroPanel1);
            this.Controls.Add(this.panel1);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "RecAmtbySR";
            this.Text = "Sales Rep by Item Summary";
            this.Load += new System.EventHandler(this.Category_Load);
            this.metroPanel1.ResumeLayout(false);
            this.metroPanel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.CategorysDataGridView)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.sizeBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.colorBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.CategoryBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.recivedVoucharIndexResultBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.spgetArticleResultBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.articleTypeBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.styleBindingSource)).EndInit();
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private MetroFramework.Controls.MetroPanel metroPanel1;
        public System.Windows.Forms.BindingSource CategoryBindingSource;
        private System.Windows.Forms.DataGridViewTextBoxColumn CategoryDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridView CategorysDataGridView;
        private System.Windows.Forms.BindingSource colorBindingSource;
        private System.Windows.Forms.BindingSource sizeBindingSource;
        private System.Windows.Forms.BindingSource styleBindingSource;
        private System.Windows.Forms.BindingSource articleTypeBindingSource;
        private System.Windows.Forms.BindingSource spgetArticleResultBindingSource;
        private System.Windows.Forms.BindingSource recivedVoucharIndexResultBindingSource;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label10;
        private MetroFramework.Controls.MetroComboBox cmbxCustomer;
        private MetroFramework.Controls.MetroButton btnSearch;
        private System.Windows.Forms.Panel panel1;
        private MetroFramework.Controls.MetroComboBox cmbxSalesPerson;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.DataGridViewTextBoxColumn Reference;
        private System.Windows.Forms.DataGridViewTextBoxColumn SNO;
        private System.Windows.Forms.DataGridViewTextBoxColumn Date;
        private System.Windows.Forms.DataGridViewTextBoxColumn Debit;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column1;



        ///// <summary>
        ///// Required designer variable.
        ///// </summary>
        //private System.ComponentModel.IContainer components = null;

        ///// <summary>
        ///// Clean up any resources being used.
        ///// </summary>
        ///// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        //protected override void Dispose(bool disposing)
        //{
        //    if (disposing && (components != null))
        //    {
        //        components.Dispose();
        //    }
        //    base.Dispose(disposing);
        //}

        //#region Windows Form Designer generated code

        ///// <summary>
        ///// Required method for Designer support - do not modify
        ///// the contents of this method with the code editor.
        ///// </summary>
        //private void InitializeComponent()
        //{
        //    this.components = new System.ComponentModel.Container();
        //    this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
        //    this.Text = "Colour";
        //}

        //#endregion


        /// <summary>




        /// <summary>
        /// Required designer variable.
        ///// </summary>
        //private System.ComponentModel.IContainer components = null;

        ///// <summary>
        ///// Clean up any resources being used.
        ///// </summary>
        ///// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        //protected override void Dispose(bool disposing)
        //{
        //    if (disposing && (components != null))
        //    {
        //        components.Dispose();
        //    }
        //    base.Dispose(disposing);
        //}

        //#region Windows Form Designer generated code

        ///// <summary>
        ///// Required method for Designer support - do not modify
        ///// the contents of this method with the code editor.
        ///// </summary>
        //private void InitializeComponent()
        //{
        //    this.components = new System.ComponentModel.Container();
        //    this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
        //    this.Text = "VendorLedger";
        //}

        //#endregion












        ///// <summary>
        ///// Required designer variable.
        ///// </summary>
        //private System.ComponentModel.IContainer components = null;

        ///// <summary>
        ///// Clean up any resources being used.
        ///// </summary>
        ///// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        //protected override void Dispose(bool disposing)
        //{
        //    if (disposing && (components != null))
        //    {
        //        components.Dispose();
        //    }
        //    base.Dispose(disposing);
        //}

        //#region Windows Form Designer generated code

        ///// <summary>
        ///// Required method for Designer support - do not modify
        ///// the contents of this method with the code editor.
        ///// </summary>
        //private void InitializeComponent()
        //{
        //    this.components = new System.ComponentModel.Container();
        //    this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
        //    this.Text = "CustomerVendor";
        //}

        //#endregion



    }
}