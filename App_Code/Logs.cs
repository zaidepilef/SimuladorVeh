using System;
using System.IO;
using System.Data;
using System.Configuration;
using System.Globalization;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml;

/// <summary>
/// Summary description for Logs
/// </summary>
public class Logs
{
    public static void writeToLogFile(string logMessage)
    {
        DataSet dataSet = new DataSet();
        DataSet dataSetFilter = new DataSet();

        try
        {

            string fecha_log = DateTime.Now.ToString("dd-MM-yyyy");

            string strLogMessage = string.Empty;
            //string strLogFile = AppDomain.CurrentDomain.BaseDirectory + System.Configuration.ConfigurationManager.AppSettings["logFilePath"].ToString() + fecha_log + "_" + cod_conv + ".txt";
            string strLogFile = AppDomain.CurrentDomain.BaseDirectory + "\\log\\LOG_" + fecha_log + ".txt";

            StreamWriter swLog;
            strLogMessage = string.Format("{0};{1}", DateTime.Now, logMessage);

            if (!File.Exists(strLogFile))
                swLog = new StreamWriter(strLogFile);
            else
                swLog = File.AppendText(strLogFile);

            swLog.WriteLine(strLogMessage);
            swLog.WriteLine();
            swLog.Close();
        }
        catch
        {

        }
    }

    public static void writeToLogFile(string nom_file, string logMessage)
    {
        DataSet dataSet = new DataSet();
        DataSet dataSetFilter = new DataSet();

        try
        {
            string fecha_log = DateTime.Now.ToString("dd-MM-yyyy HH-mm");
            string strLogMessage = string.Empty;
            //string strLogFile = AppDomain.CurrentDomain.BaseDirectory + System.Configuration.ConfigurationManager.AppSettings["logFilePath"].ToString() + fecha_log + "_" + cod_conv + ".txt";
            string strLogFile = AppDomain.CurrentDomain.BaseDirectory + "\\log\\" + nom_file;

            StreamWriter swLog;
            strLogMessage = string.Format("{0};{1}", DateTime.Now, logMessage);

            if (!File.Exists(strLogFile))
                swLog = new StreamWriter(strLogFile);
            else
                swLog = File.AppendText(strLogFile);

            swLog.WriteLine(strLogMessage);
            swLog.WriteLine();
            swLog.Close();
        }
        catch
        {

        }
    }
}