﻿using Lib;
using System;
using System.Drawing;
using System.Windows.Forms;

namespace SalesMngmt.Configs
{
    public partial class SyncClientDB : MetroFramework.Forms.MetroForm
    {
        public SyncClientDB()
        {
            InitializeComponent();
        }

        private void SyncClientDB_Load(object sender, EventArgs e)
        {

        }

        private void metroButton1_Click(object sender, EventArgs e)
        {
            pictureBox1.Show();
            richTextBox1.Text = string.Empty;
            metroButton1.BackColor = Color.Gray;
            SyncDb syncDb = new SyncDb();
            var msg = syncDb.SyncDbe();
            richTextBox1.AppendText("Sync Started !" + Environment.NewLine, Color.Black);
            foreach (var item in msg.Split('~'))
            {
                if (item.Contains("..."))
                {
                    richTextBox1.AppendText(item + Environment.NewLine, Color.Green);
                }
                else if (item.Contains("!!!"))
                {
                    richTextBox1.AppendText(item + Environment.NewLine, Color.Red);
                }
            }

            richTextBox1.AppendText("Sync Completed!" + Environment.NewLine, Color.Black);
            metroButton1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(128)))), ((int)(((byte)(255)))), ((int)(((byte)(128)))));
            pictureBox1.Hide();
        }
    }

    public static class RichTextBoxExtensions
    {
        public static void AppendText(this RichTextBox box, string text, Color color)
        {
            box.SelectionStart = box.TextLength;
            box.SelectionLength = 0;
            box.SelectionColor = color;
            box.AppendText(text);
            box.SelectionColor = box.ForeColor;
        }
    }
}
