namespace SalesMngmt.Reporting
{
    partial class ItembySR
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle4 = new System.Windows.Forms.DataGridViewCellStyle();
            this.metroPanel1 = new MetroFramework.Controls.MetroPanel();
            this.label1 = new System.Windows.Forms.Label();
            this.CategorysDataGridView = new System.Windows.Forms.DataGridView();
            this.SNO = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Date = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Reference = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Debit = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.sizeBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.colorBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.CategoryBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.recivedVoucharIndexResultBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.spgetArticleResultBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.articleTypeBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.styleBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.label6 = new System.Windows.Forms.Label();
            this.label10 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.cmbSalesPerson = new MetroFramework.Controls.MetroComboBox();
            this.dtFrom = new MetroFramework.Controls.MetroDateTime();
            this.dtTOdate = new MetroFramework.Controls.MetroDateTime();
            this.btnSearch = new MetroFramework.Controls.MetroButton();
            this.panel1 = new System.Windows.Forms.Panel();
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
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle3.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle3.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F);
            dataGridViewCellStyle3.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle3.SelectionBackColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle3.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle3.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.CategorysDataGridView.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle3;
            this.CategorysDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.CategorysDataGridView.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.SNO,
            this.Date,
            this.Reference,
            this.Debit,
            this.Column1,
            this.Column2});
            dataGridViewCellStyle4.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle4.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle4.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle4.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle4.SelectionBackColor = System.Drawing.Color.Tan;
            dataGridViewCellStyle4.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle4.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.CategorysDataGridView.DefaultCellStyle = dataGridViewCellStyle4;
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
            // SNO
            // 
            this.SNO.DataPropertyName = "IName";
            this.SNO.HeaderText = "Item";
            this.SNO.Name = "SNO";
            this.SNO.ReadOnly = true;
            // 
            // Date
            // 
            this.Date.DataPropertyName = "Qty";
            this.Date.HeaderText = "Quantity";
            this.Date.Name = "Date";
            this.Date.ReadOnly = true;
            // 
            // Reference
            // 
            this.Reference.DataPropertyName = "SalesPriceP";
            this.Reference.HeaderText = "Price";
            this.Reference.Name = "Reference";
            this.Reference.ReadOnly = true;
            // 
            // Debit
            // 
            this.Debit.DataPropertyName = "Amt";
            this.Debit.HeaderText = "Amount";
            this.Debit.Name = "Debit";
            this.Debit.ReadOnly = true;
            // 
            // Column1
            // 
            this.Column1.DataPropertyName = "EmployeName";
            this.Column1.HeaderText = "Sales Rep";
            this.Column1.Name = "Column1";
            this.Column1.ReadOnly = true;
            // 
            // Column2
            // 
            this.Column2.DataPropertyName = "EDate";
            this.Column2.HeaderText = "Date";
            this.Column2.Name = "Column2";
            this.Column2.ReadOnly = true;
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
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(270, 42);
            this.label6.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(48, 18);
            this.label6.TabIndex = 13;
            this.label6.Text = "From";
            this.label6.Click += new System.EventHandler(this.label6_Click);
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.BackColor = System.Drawing.Color.White;
            this.label10.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label10.Location = new System.Drawing.Point(643, 42);
            this.label10.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(109, 18);
            this.label10.TabIndex = 58;
            this.label10.Text = "Sales Person";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(6, 42);
            this.label5.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(28, 18);
            this.label5.TabIndex = 12;
            this.label5.Text = "To";
            // 
            // cmbSalesPerson
            // 
            this.cmbSalesPerson.FormattingEnabled = true;
            this.cmbSalesPerson.ItemHeight = 24;
            this.cmbSalesPerson.Location = new System.Drawing.Point(791, 36);
            this.cmbSalesPerson.Margin = new System.Windows.Forms.Padding(4);
            this.cmbSalesPerson.Name = "cmbSalesPerson";
            this.cmbSalesPerson.Size = new System.Drawing.Size(203, 30);
            this.cmbSalesPerson.TabIndex = 59;
            this.cmbSalesPerson.UseSelectable = true;
            // 
            // dtFrom
            // 
            this.dtFrom.Location = new System.Drawing.Point(338, 36);
            this.dtFrom.Margin = new System.Windows.Forms.Padding(4);
            this.dtFrom.MinimumSize = new System.Drawing.Size(0, 30);
            this.dtFrom.Name = "dtFrom";
            this.dtFrom.Size = new System.Drawing.Size(209, 30);
            this.dtFrom.TabIndex = 11;
            // 
            // dtTOdate
            // 
            this.dtTOdate.Location = new System.Drawing.Point(45, 36);
            this.dtTOdate.Margin = new System.Windows.Forms.Padding(4);
            this.dtTOdate.MinimumSize = new System.Drawing.Size(0, 30);
            this.dtTOdate.Name = "dtTOdate";
            this.dtTOdate.Size = new System.Drawing.Size(205, 30);
            this.dtTOdate.TabIndex = 12;
            // 
            // btnSearch
            // 
            this.btnSearch.BackColor = System.Drawing.Color.DodgerBlue;
            this.btnSearch.FontSize = MetroFramework.MetroButtonSize.Medium;
            this.btnSearch.ForeColor = System.Drawing.Color.White;
            this.btnSearch.Location = new System.Drawing.Point(1016, 32);
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
            this.panel1.Controls.Add(this.btnSearch);
            this.panel1.Controls.Add(this.dtTOdate);
            this.panel1.Controls.Add(this.dtFrom);
            this.panel1.Controls.Add(this.cmbSalesPerson);
            this.panel1.Controls.Add(this.label5);
            this.panel1.Controls.Add(this.label10);
            this.panel1.Controls.Add(this.label6);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(1250, 103);
            this.panel1.TabIndex = 61;
            // 
            // ItembySR
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1250, 573);
            this.Controls.Add(this.metroPanel1);
            this.Controls.Add(this.panel1);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "ItembySR";
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
        private System.Windows.Forms.DataGridViewTextBoxColumn SNO;
        private System.Windows.Forms.DataGridViewTextBoxColumn Date;
        private System.Windows.Forms.DataGridViewTextBoxColumn Reference;
        private System.Windows.Forms.DataGridViewTextBoxColumn Debit;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column1;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label label5;
        private MetroFramework.Controls.MetroComboBox cmbSalesPerson;
        private MetroFramework.Controls.MetroDateTime dtFrom;
        private MetroFramework.Controls.MetroDateTime dtTOdate;
        private MetroFramework.Controls.MetroButton btnSearch;
        private System.Windows.Forms.Panel panel1;



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