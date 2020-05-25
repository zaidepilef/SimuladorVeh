using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

using Oracle.DataAccess.Client;
using MapfreMCL.oracle;

using System.Web.Mail;
using System.Text.RegularExpressions;
using System.Collections;
using System.Globalization;

using System.Security.Cryptography;
using System.Text;

/// <summary>
/// Summary description for UtilesWeb
/// </summary>
public abstract class UtilesWeb
{
    #region Agrega el Stylo (flow) al combo
    public static System.Web.UI.HtmlControls.HtmlSelect Agrega_Stylo(System.Web.UI.HtmlControls.HtmlSelect cmb)
    {
        cmb.Style["WIDTH"] = "180";
        cmb.Attributes.Add("class", "textbox2");

        return cmb;
    }

    public static void Agrega_Stylo(System.Web.UI.WebControls.DropDownList cmb)
    {
        cmb.Style["WIDTH"] = "180";
        // cmb.Attributes.Add("class", "textbox2");
    }

    public static System.Web.UI.HtmlControls.HtmlSelect Agrega_Stylo(System.Web.UI.HtmlControls.HtmlSelect cmb, string nom_css)
    {
        cmb.Style["WIDTH"] = "180";
        cmb.Attributes.Add("class", nom_css);

        return cmb;
    }

    public static System.Web.UI.HtmlControls.HtmlSelect Agrega_Stylo(System.Web.UI.HtmlControls.HtmlSelect cmb, string nom_css, string width)
    {
        cmb.Style["WIDTH"] = width;
        cmb.Attributes.Add("class", nom_css);

        return cmb;
    }
    #endregion

    #region Link Boton
    public System.Web.UI.HtmlControls.HtmlAnchor LinkBoton(string href, string nom_imagen1, string nom_imagen2, string name_id_img)
    {

        HtmlAnchor a = new HtmlAnchor();



        a.HRef = href;

        a.Attributes.Add("onMouseOver", "document." + name_id_img + ".src='../images/" + nom_imagen2 + ".gif';");

        a.Attributes.Add("onMouseOut", "document." + name_id_img + ".src='../images/" + nom_imagen1 + ".gif';");



        HtmlImage img = new HtmlImage();



        img.Attributes.Add("hspace", "10");

        img.Attributes.Add("vspace", "10");

        img.Border = 0;

        img.Attributes.Add("name", name_id_img);

        img.Src = "../images/" + nom_imagen1 + ".gif";



        a.Controls.Add(img);



        return a;



    }

    #endregion

    #region Agrega Valor Seleccionar a un combo ó dropdownlist con valor "0"
    public static HtmlSelect Agrega_Seleccionar(System.Web.UI.HtmlControls.HtmlSelect cmb)
    {
        cmb.Items.Insert(0, new ListItem("Seleccionar", "0"));
        cmb.SelectedIndex = 0;
        return cmb;
    }
    public static DropDownList Agrega_Seleccionar(DropDownList cmb)
    {
        cmb.Items.Insert(0, new ListItem("Seleccionar", "0"));
        cmb.SelectedIndex = 0;
        return cmb;
    }
    #endregion

    #region Carga los Anios en un DropDownList

    public static void Carga_Anios_DropGenerico(DropDownList cmb, int anio_ini, int anio_fin)
    {
        for (int i = anio_ini; i <= anio_fin; i++)
        {
            cmb.Items.Insert(0, new ListItem(i.ToString(), i.ToString()));
        }
    }


    public static void Carga_Anios_DropGenerico(DropDownList cmb, int anio_ini)
    {

        int anio = System.DateTime.Now.Year;
        int mes = System.DateTime.Now.Month;
        int anio_vehicular;

        if (mes > 7)
        { anio_vehicular = anio + 1; }
        else
        { anio_vehicular = anio; }

        for (int i = anio_ini; i <= anio_vehicular; i++)
        {
            cmb.Items.Insert(0, new ListItem(i.ToString(), i.ToString()));
        }
    }



    #endregion

    #region Entrega el Rut Formateado XX.XXX.XXX-X
    public static string getFormated(string strRut)
    {
        string dv = strRut[strRut.Length - 1].ToString();
        string numeros = strRut.Substring(0, strRut.Length - 1);
        string rut_formated = "-";
        int k = 0;
        for (int i = numeros.Length - 1; i >= 0; i--)
        {
            k++;
            if (k == 4)
            {
                rut_formated = numeros[i] + "." + rut_formated;
                k = 1;
            }
            else
            {
                rut_formated = numeros[i] + rut_formated;

            }

        }
        return rut_formated + dv;

    }
    #endregion

    #region Desformatea el rut

    public static string getUnReformated(string strRut)
    {
        return strRut.Replace(".", "").Replace("-", "");
    }
    #endregion

    #region Devuelve el Id Session GUID
    public static string getIdSession()
    {
        Guid g;
        g = Guid.NewGuid();
        string guid;
        guid = g.ToString();
        guid = guid.Replace("-", "");
        return guid;
    }
    #endregion

    #region Captura el Valor de una Propiedad de un OBJ

    public static string GetPropertyValue(object obj, string propiedad)
    {
        try
        {
            return Convert.ToString(obj.GetType().GetProperty(propiedad).GetValue(obj, null));
        }
        catch
        {
            return null;
        }
    }

    #endregion

    #region Valida RUT
    //-------------------------------------------------------------------------------------------------------
    public static bool ValidaRUT(string obj)
    {

        if (obj.Length >= 7)//Escrito Completamente los 6 caracteres
        {
            string rut = obj.Substring(0, obj.Length - 1);

            if (isNumero(rut))
            {
                return true;
            }


        }

        return false;
    }
    //-------------------------------------------------------------------------------------------------------
    public static bool DV_RUT(string normalizedRUT)
    {


        string f_dv = normalizedRUT.Substring(normalizedRUT.Length - 1, 1);
        int f_largo = normalizedRUT.Length;
        string rut = normalizedRUT.Substring(0, normalizedRUT.Length - 1);
        int f_rut = Convert.ToInt32(rut);
        int f_total = 0;
        int f_nn, f_mult;
        string f_dv_aux;


        f_mult = 1;
        f_largo = f_largo - 2;
        for (int i = f_largo; i >= 0; i--)
        {//12449768K
            string chr = normalizedRUT[i].ToString();
            f_nn = Convert.ToInt32(chr);
            if (f_mult == 7) f_mult = 1;
            f_mult++;
            f_total += (f_nn * f_mult);
        }
        int f_resto = f_total % 11;

        if (f_resto == 1)
        {
            f_dv_aux = "K";
        }
        else
        {
            if (f_resto == 0)
            {
                f_dv_aux = "0";
            }
            else
            {

                f_nn = 11 - f_resto;
                f_dv_aux = f_nn.ToString();
            }
        }


        if (f_dv_aux == f_dv)
        { return true; }
        else
        { return false; }






    }
    //--------------------------------------------------------------------------------------------------------
    public static bool isNumero(string s)
    {
        string numeros = "0123456789";

        foreach (char c in s)
        {
            if (numeros.IndexOf(c) < 0)
            {
                return false;
            }

        }
        return true;
    }

    #endregion

    #region Valida Email
    public static bool ValidaEmail(string direccion)
    {
        //string ExpReg = @"^[a-z][a-z|0-9|]*([_][a-z|0-9]+)*([.][a-z|" +
        //               @"0-9]+([_][a-z|0-9]+)*)?@[a-z][a-z|0-9|]*\.([a-z]" +
        //                 @"[a-z|0-9]*(\.[a-z][a-z|0-9]*)?)$";
        string ExpReg = @"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}" +
         @"\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\" +
         @".)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$";
        System.Text.RegularExpressions.Match match =
            Regex.Match(direccion.Trim(), ExpReg, RegexOptions.IgnoreCase);

        if (match.Success) return true;
        else return false;
    }
    #endregion

    #region Valida Telefono
    public static bool ValidaTelefono(string fono)
    {

        string ExpReg = "^\\d{2}-\\d{2}-\\d{6}|d{7}$";


        System.Text.RegularExpressions.Match match =
              Regex.Match(fono.Trim(), ExpReg, RegexOptions.IgnoreCase);


        if (match.Success) return true;
        else return false;
    }


    #endregion

    #region Envio de E-Mail...Acusete
    public static void EnviaCorreoAcusete(string error, string titulo)
    {
        MailMessage mail = new MailMessage();

        SmtpMail.SmtpServer = ConfigurationManager.AppSettings["ServidorCorreo"];

        string ErrorMessage = titulo + " [" + DateTime.Now.ToString() + "] : <br><br>" + error;

        mail.From = ConfigurationManager.AppSettings["CorreoSoporte_From"];
        mail.To = ConfigurationManager.AppSettings["CorreoSoporte_To"];
        mail.Subject = titulo;
        mail.Priority = MailPriority.High;
        mail.BodyFormat = MailFormat.Html;
        mail.Body = ErrorMessage;
        SmtpMail.Send(mail);
    }

    #endregion

    #region Envio de E-Mail...
    public static void EnviaCorreo(string direccion, string titulo, string mensaje)
    {
        MailMessage mail = new MailMessage();

        SmtpMail.SmtpServer = ConfigurationManager.AppSettings["ServidorCorreo"];

        mail.From = "ov@mapfre.cl";
        mail.To = direccion;
        mail.Subject = titulo;
        mail.Priority = MailPriority.High;
        mail.BodyFormat = MailFormat.Html;
        mail.Body = mensaje;
        SmtpMail.Send(mail);
    }

    #endregion

    #region Valida Fecha
    /*
Aquí va un ejemplo que yo uso para validar el numero de albarán introducido: [AB]([0-9]{9})
La explicación es la siguiente:
[AB] -> Indica que el primer carácter de la cadena debe ser A o B. En general, con los corchetes indicamos que en esa posición debe aparecer una caracter, pero solo uno, de los que listamos.
([0-9]{9}) ->Indica que los siguientes nueve caracteres {9} deben ser digitos (del 0 al 9)
Por ejemplo, la expresión sería correcta con: A000001257 ó B000000000, pero fallaria con A1257 o C000001257         
         */
    public static bool ValidaFecha(string fecha)
    {
        //            string ExpReg = @"(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$";

        string dia = "(0[1-9]|[12][0-9]|3[01])";
        string mes = "(0[1-9]|[1][0-2])";
        string anio = "(19|20)[0-9]{2}";
        string separador = "[- /.]";

        //fecha = "21/12.1999";
        string ExpReg = dia + separador + mes + separador + anio;

        System.Text.RegularExpressions.Match match =
              Regex.Match(fecha.Trim(), ExpReg, RegexOptions.IgnoreCase);


        if (match.Success) return true;
        else return false;
    }


    #endregion

    #region Calcula Edad

    public static DataRow CalculaEdad(string fecha)
    {

        DataTable DT = new DataTable();
        DT.Columns.Add("anios");
        DT.Columns.Add("mes");
        DT.Columns.Add("dias");
        DataRow dr = DT.NewRow();

        CultureInfo EEUU = new CultureInfo("es-CL");//en-US
        string ahora = DateTime.Now.ToString("dd/MM/yyyy");
        DateTime hoy = Convert.ToDateTime(ahora, EEUU);
        DateTime fn = Convert.ToDateTime(fecha, EEUU);

        dr["anios"] = Convert.ToString((int)((hoy - fn).TotalDays / 365));
        dr["dias"] = Convert.ToString((int)((hoy - fn).TotalDays));

        return dr;
    }
    #endregion

    #region Firma PDF Servidor
    //pathIn: Ruta del documento PDF en el lado del servidor.
    //pathOut: Ruta del documento PDF firmado en el lado del servidor.
    //servicio: identificador del servidor de firma preconfigurado.
    //Comentario - Ubicacion : Texto que será visible en la firma del PDF y una localización
    public static bool firmaPDFServidor(string NamePDF)
    {
        try
        {
            String pathIn = ConfigurationManager.AppSettings["pathIn"] + NamePDF + ".PDF"; ;
            String pathOut = ConfigurationManager.AppSettings["pathOut"] + NamePDF + "_sign.PDF";
            String servicio = ConfigurationManager.AppSettings["servicio"];
            String Comentario = ConfigurationManager.AppSettings["comentario"];
            String Ubicacion = ConfigurationManager.AppSettings["ubicacion"];

            Firmadora.Firmador firma = new Firmadora.Firmador();

            bool resp = firma.firmadorPDFServidor(pathIn, pathOut, int.Parse(servicio), Comentario, Ubicacion);
            return resp;

        }
        catch
        {
            return false;
        }
        return false;
    }

    #endregion
	
	
	#region Encriptador
	
	        public static string Encriptador(string xml)
        {
            try
            {
                byte[] texto_plano = Encoding.UTF8.GetBytes(xml);
                byte[] salt = Encoding.UTF8.GetBytes("Salted__");


                byte[] password = Encoding.UTF8.GetBytes("d?K7>3(,@@T>>3p)4&k@Mcd?");
                MD5 md5 = MD5.Create();

                int preKeyLength = password.Length + salt.Length;
                byte[] preKey = new byte[preKeyLength];

                Buffer.BlockCopy(password, 0, preKey, 0, password.Length);
                Buffer.BlockCopy(salt, 0, preKey, password.Length, salt.Length);

                byte[] key = md5.ComputeHash(preKey);
                //Console.WriteLine("key: {0}", ToHexString(key));

                int preIVLength = key.Length + preKeyLength;
                byte[] preIV = new byte[preIVLength];

                Buffer.BlockCopy(key, 0, preIV, 0, key.Length);
                Buffer.BlockCopy(preKey, 0, preIV, key.Length, preKey.Length);

                byte[] iv = md5.ComputeHash(preIV);
                //Console.WriteLine("iv: {0}", ToHexString(iv));

                md5.Clear();
                md5 = null;

                byte[] des_iv = new byte[8];
                byte[] des_key = new byte[24];


                Buffer.BlockCopy(key, 0, des_key, 0, 16);
                Buffer.BlockCopy(iv, 0, des_key, 16, 8);

                Buffer.BlockCopy(iv, 8, des_iv, 0, 8);

                // Create a new 3DES key.
                TripleDESCryptoServiceProvider des = new TripleDESCryptoServiceProvider();
                des.Mode = CipherMode.CBC;
                des.KeySize = 192;
                des.BlockSize = 64;
                des.Padding = PaddingMode.PKCS7;
                des.Key = des_key;
                des.IV = des_iv;


                ICryptoTransform ic = des.CreateEncryptor();
                byte[] EncryptData = ic.TransformFinalBlock(texto_plano, 0, texto_plano.Length);

                byte[] trama_salida = new byte[16 + EncryptData.Length];

                Buffer.BlockCopy(Encoding.UTF8.GetBytes("Salted__"), 0, trama_salida, 0, 8);
                Buffer.BlockCopy(salt, 0, trama_salida, 8, salt.Length);
                Buffer.BlockCopy(EncryptData, 0, trama_salida, 8 + salt.Length, EncryptData.Length);
                string resp;//= DecryptTextFromMemory(trama_salida);

                //resp = Convert.ToString(trama_salida);

                // Convert the byte array to hexadecimal string
                StringBuilder sb = new StringBuilder();
                for (int i = 0; i < trama_salida.Length; i++)
                {
                    sb.Append(trama_salida[i].ToString("X2"));
                    // To force the hex string to lower-case letters instead of
                    // upper-case, use he following line instead:
                    // sb.Append(hashBytes[i].ToString("x2")); 
                }

                return sb.ToString();

            }
            catch (ArgumentException ex)
            {
                return "ERROR:" + ex.Message;
            }
        }

		#endregion

    #region Ejecuta Scripts y de pasadita mato toda Session[]...si es po-pup
    public static void EjecutaJs(Page pag, string js)
    {
        ScriptManager.RegisterStartupScript(pag, pag.GetType(), Guid.NewGuid().ToString(), js, true);

    }
    #endregion

    #region Agrega Cell a un  Row
    public static void AgregaCell(GridViewRow row, string dato)
    {
        TableCell cell = new TableCell();
        cell.Text = dato;
        row.Cells.Add(cell);
    }
    #endregion

    #region Genera HTML Template para UpdateProgress

    public static void ProcessInfo(UpdateProgress Up, string msg)
    {
        Up.Controls.Clear();
        Control c = new Control();
        HtmlGenericControl gc = new HtmlGenericControl("div");
        gc.InnerHtml = "<div class='overlay'></div><div class='centralimg'>" + msg + "</div>";
        c.Controls.Add(gc);
        Up.Controls.Add(c);
    }

    #endregion

    #region Valida si es numero
    //http://msdn.microsoft.com/en-us/library/system.globalization.numberstyles(vs.71).aspx
    public static bool isNumeric(string val, NumberStyles NumberStyle)
    {
        Double result;
        return Double.TryParse(val, NumberStyle, CultureInfo.CurrentCulture, out result);
    }

    public static bool isNumeric(string val, NumberStyles NumberStyle, string CultureName)
    {
        Double result;
        return Double.TryParse(val, NumberStyle, new CultureInfo(CultureName), out result);
    }

    #endregion

    #region Valida Patente

    public static string ValidaPatente(string obj)
    {

        if (obj.Length == 6)//Escrito Completamente los 6 caracteres
        {

            if (isLetra(obj.Substring(0, 2)))
            {

                if (isLetra(obj.Substring(2, 2)))
                {
                    if (isNumero(obj.Substring(4, 2)))
                    {
                        return "OK_NUEVO";//Formato Nuevo de Patente   
                        //  msg = valida_patente(obj.value) ; 
                    }
                }
                //---------------------------------------------------

                if (isNumero(obj.Substring(2, 4)))//Son numeros
                {
                    return "OK_VIEJO";
                } //Formato Antiguo de Patente   
                // alert('msg2='+msg)				
            }

        }

        return "ERROR";
    }

    public static bool isLetra(string s)
    {
        string Letras = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        s = s.ToUpper();
        foreach (char c in s)
        {
            if (Letras.IndexOf(c) < 0)
            {
                return false;
            }

        }
        return true;
    }

    public string DV_PAT_NUEVO(string txt)
    {
        string letras = "BCDFGHJKLPRSTVWXYZ";
        string valores = "123456789023456789";
        string ND = "";
        string DV = "";
        string SP = "0";
        txt = txt.ToUpper();
        for (int i = 0; i < 4; i++)
        {
            string L = txt[i].ToString();
            int h = letras.IndexOf(L);
            if (h < 0) return "-1";//'Error_Caracter'
            ND += valores[h];
        }



        string NV = ND + txt[4] + txt[5];
        //alert('NV='+NV);
        //alert('Num='+NV.length)
        int k = 0;
        int ii = 0;
        for (int i = NV.Length; i > 0; i--)
        {

            int num = Convert.ToInt32(Convert.ToInt32(NV[i - 1]) * (2 + k));
            SP = SP + num.ToString();

            k++;
            ii = i;
        }

        Int32 num1 = Convert.ToInt32(NV[ii - 1]);
        Int32 num2 = num1 * 2;
        SP += num2.ToString();


        // int armado = num2(SP);
        int res = (num2 % 11);

        if (res == 1) DV = "K";
        else if (res == 0) DV = "0";
        else DV = Convert.ToString(11 - (num2 % 11));


        //alert('DV='+DV)
        return DV;


    }

    #endregion

    public static void Asigna_dat(DataRow r, System.Web.UI.WebControls.TextBox tbox, string texto)
    {
        if (r[texto] != System.DBNull.Value)
            tbox.Text = r[texto].ToString().ToUpper();
    }

    public static void Asigna_dat_block(DataRow r, System.Web.UI.WebControls.TextBox tbox, string texto)
    {
        if (r[texto].ToString() != "")
        {
            tbox.Text = r[texto].ToString().ToUpper();
            tbox.Enabled = false;
        }
        else
            tbox.Enabled = true;
    }

    public static void selected(DropDownList combo, string cod)
    {
        for (int i = 1; i < combo.Items.Count; i++)
        {
            if (combo.Items[i].Value == cod)
            {
                combo.SelectedIndex = i;
                break;
            }
        }
    }

    public static void selected_block(DropDownList combo, string cod)
    {
        for (int i = 1; i < combo.Items.Count; i++)
        {
            if (combo.Items[i].Value == cod && cod != "0")
            {
                combo.SelectedIndex = i;
                combo.Enabled = false;
                break;
            }
            else
                combo.Enabled = true;

        }
    }

	 public static void selected_block_sexo(DropDownList combo, string cod)
    {
        for (int i = 0; i < combo.Items.Count; i++)
        {
            if (combo.Items[i].Value == cod)
            {
                combo.SelectedIndex = i;
                combo.Enabled = false;
                break;
            }
            else
                combo.Enabled = true;

        }
    }

    public static void selected_block(DropDownList combo, string cod, bool visible)
    {
        for (int i = 1; i < combo.Items.Count; i++)
        {
            if (combo.Items[i].Value == cod && cod != "0")
            {
                combo.SelectedIndex = i;
                combo.Enabled = false;
                if (visible)
                {
                    combo.Visible = false;
                }
                break;
            }
            else
            {
                combo.Enabled = true;
                if (visible)
                {
                    combo.Visible = true;
                }
            }
        }
    }

    public static void selected_block(DropDownList combo, string cod, bool visible, Label label)
    {
        for (int i = 1; i < combo.Items.Count; i++)
        {
            if (combo.Items[i].Value == cod && cod != "0")
            {
                combo.SelectedIndex = i;
                combo.Enabled = false;
                if (visible)
                {
                    combo.Visible = false;
                    label.Visible = false;
                }
                break;
            }
            else
            {
                combo.Enabled = true;
                if (visible)
                {
                    combo.Visible = true;
                    label.Visible = true;
                }
            }

        }
    }

    public static void OpenNewWindow(Page page, string link)
    {

        string winFeatures = "status=1,toolbar=0,menubar=0,location=1,scrollbars=1,resizable=1,width=800,height=600";

        ScriptManager.RegisterStartupScript(page, page.GetType(), "newWindow", "window.open('" + link + "','_blank','" + winFeatures + "');", true);

    }

    public static void OpenNewWindow(Page page, string link, string width, string height)
    {

        string winFeatures = "status=1,toolbar=0,menubar=0,location=1,scrollbars=1,resizable=1,width=" + width + ",height=" + height + "";

        ScriptManager.RegisterStartupScript(page, page.GetType(), "newWindow", "window.open('" + link + "','_blank','" + winFeatures + "');", true);

    }

    public static void OpenNewWindow(Page page, string link, string width, string height, string scroll, string resize)
    {

        string winFeatures = "status=1,toolbar=0,menubar=0,location=1,scrollbars=" + scroll + ",resizable=" + resize + ",width=" + width + ",height=" + height + "";

        ScriptManager.RegisterStartupScript(page, page.GetType(), "newWindow", "window.open('" + link + "','_blank','" + winFeatures + "');", true);

    }

    public static void Carga_Edad(DropDownList cmb, int anio_ini, int anio_fin)
    {
        for (int i = anio_fin; i >= anio_ini; i--)
        {
            cmb.Items.Insert(0, new ListItem(i.ToString(), i.ToString()));
        }

        Agrega_Seleccionar(cmb);
    }

    public static bool ValidaTextBox(Page pag, TextBox textbox)
    {
        if (textbox.Text == "")
        {
            EjecutaJs(pag, "alert('Por favor, " + textbox.ToolTip.ToString() + "');");
            return false;
        }

        return true;
    }

    public static bool ValidaDrowDownList(Page pag, DropDownList dropdown)
    {
        if (dropdown.SelectedValue == "0")
        {
            EjecutaJs(pag, "alert('Por favor, " + dropdown.ToolTip.ToString() + "');");
            return false;
        }

        return true;
    }

    public static bool ValidaTextBoxEmail(Page pag, TextBox textbox)
    {
        if (textbox.Text == "")
        {
            EjecutaJs(pag, "alert('Por favor, " + textbox.ToolTip.ToString() + "');");
            return false;
        }
        else
        {
            if (UtilesWeb.ValidaEmail(textbox.Text))
                return true;
            else
            {
                EjecutaJs(pag, "alert('Por favor, " + textbox.ToolTip.ToString() + "');");
                return false;
            }
        }
        return true;
    }

    public static bool ValidaTextBox(Page pag, TextBox textbox, ScriptManager script)
    {
        if (textbox.Text == "")
        {
            EjecutaJs(pag, "alert('Por favor, " + textbox.ToolTip.ToString() + "');");
            //script.SetFocus(textbox);
            return false;
        }

        return true;
    }

    public static bool ValidaDrowDownList(Page pag, DropDownList dropdown, ScriptManager script)
    {
        if (dropdown.SelectedValue == "0")
        {
            EjecutaJs(pag, "alert('Por favor, " + dropdown.ToolTip.ToString() + "');");
            //script.SetFocus(dropdown);
            return false;
        }

        return true;
    }

    public static bool ValidaTextBoxEmail(Page pag, TextBox textbox, ScriptManager script)
    {
        if (textbox.Text == "")
        {
            EjecutaJs(pag, "alert('Por favor, " + textbox.ToolTip.ToString() + "');");
            script.SetFocus(textbox);
            return false;
        }
        else
        {
            if (UtilesWeb.ValidaEmail(textbox.Text))
                return true;
            else
            {
                EjecutaJs(pag, "alert('Por favor, " + textbox.ToolTip.ToString() + "');");
                script.SetFocus(textbox);
                return false;
            }
        }
        return true;
    }

    public static bool IsValidNumber(string number)
    {
        int[] DELTAS = new int[] { 0, 1, 2, 3, 4, -4, -3, -2, -1, 0 };
        int checksum = 0;
        char[] chars = number.ToCharArray();
        for (int i = chars.Length - 1; i > -1; i--)
        {
            int j = ((int)chars[i]) - 48;
            checksum += j;
            if (((i - chars.Length) % 2) == 0)
                checksum += DELTAS[j];
        }

        return ((checksum % 10) == 0);
    }

    public static string ValidaJuridico(string cod_docum_aseg)
    {
        cod_docum_aseg = cod_docum_aseg.Replace("-", "").Replace(".", "").Trim();

        int intcod_docum = Convert.ToInt32(cod_docum_aseg.Substring(0, cod_docum_aseg.Length - 1));

        if (intcod_docum >= 50000000)
            return "J";
        else
            return "N";
    }

    #region procedimiento que envia una cotización por correo
    public static DataRow EnviaCorreo_DB(string cod_cia, string cod_ramo, string cotizacion, string correo_destino, string correo_corredor, string correo_cc, string asunto, string mensaje, string rutalogo, string url, OracleConnection conexion)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conexion;

            objComando.CommandText = "MEL_K_VEHICULO.P_ENVIA_CORREO";

            //objComando.agregarINParametro("p_cod_cia", OracleDbType.Varchar2, cod_cia);
            //objComando.agregarINParametro("p_cod_ramo", OracleDbType.Varchar2, cod_ramo);
            objComando.agregarINParametro("p_num_cotizacion", OracleDbType.Varchar2, cotizacion);
            objComando.agregarINParametro("p_para", OracleDbType.Varchar2, correo_destino);
            objComando.agregarINParametro("p_reply_to", OracleDbType.Varchar2, correo_corredor);
            objComando.agregarINParametro("p_cc_to", OracleDbType.Varchar2, correo_cc);
            objComando.agregarINParametro("p_asunto", OracleDbType.Varchar2, asunto);
            objComando.agregarINParametro("p_mensaje", OracleDbType.Varchar2, mensaje);
            objComando.agregarINParametro("p_ruta_logo", OracleDbType.Varchar2, rutalogo);
            objComando.agregarINParametro("P_RUTA_FILE", OracleDbType.Varchar2, url);
            objComando.agregarOUTParametro("p_error", OracleDbType.Varchar2, 300);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador_DB.EnviaCorreo_DB : " + ex.Message);
        }
    }
    #endregion

    public static DropDownList AgregaCodigosAreaTelefono(DropDownList cmb)
    {
        ArrayList codigos = new ArrayList();

        codigos.Add("02");
        codigos.Add("06");
        codigos.Add("07");
        codigos.Add("08");
        codigos.Add("09");
        codigos.Add("32");
        codigos.Add("33");
        codigos.Add("34");
        codigos.Add("35");
        codigos.Add("41");
        codigos.Add("42");
        codigos.Add("43");
        codigos.Add("45");
        codigos.Add("51");
        codigos.Add("52");
        codigos.Add("53");
        codigos.Add("55");
        codigos.Add("57");
        codigos.Add("58");
        codigos.Add("61");
        codigos.Add("63");
        codigos.Add("64");
        codigos.Add("65");
        codigos.Add("67");
        codigos.Add("71");
        codigos.Add("72");
        codigos.Add("73");
        codigos.Add("75");

        for (int i = codigos.Count - 1; i >= 0; i--)
        {
            cmb.Items.Insert(0, new ListItem(codigos[i].ToString(), codigos[i].ToString()));
        }

        cmb.Items.Insert(0, new ListItem("..", "0"));
        cmb.SelectedIndex = 0;
        return cmb;
    }

    public static void selectedname(DropDownList combo, string cod)
    {
        for (int i = 1; i < combo.Items.Count; i++)
        {
            if (combo.Items[i].Text == cod)
            {
                combo.SelectedIndex = i;
                break;
            }
        }
    }

    public static bool ValidaRadioButtons(Page pag, RadioButton radio1, RadioButton radio2, ScriptManager script)
    {
        if (!radio1.Checked && !radio2.Checked)
        {
            EjecutaJs(pag, "alert('Por favor, " + radio1.ToolTip.ToString() + "');");
            //script.SetFocus(dropdown);
            return false;
        }

        return true;
    }

    #region procedimiento que valida cantidad de dias habiles
    public static string ValidaDuracionDiasHabil(string fecha, int cant_dias)
    {
        MCommand objComando = new MCommand();

        try
        {
            using (OracleConnection conexion = MConexion.getConexion("OVDES"))
            {
                objComando.Connection = conexion;

                objComando.CommandText = "p_valida_fechas_habil";

                //objComando.agregarINParametro("p_cod_cia", OracleDbType.Varchar2, cod_cia);
                //objComando.agregarINParametro("p_cod_ramo", OracleDbType.Varchar2, cod_ramo);
                objComando.agregarINParametro("p_fecha", OracleDbType.Varchar2, fecha);
                objComando.agregarINParametro("p_num_dias", OracleDbType.Varchar2, cant_dias);
                objComando.agregarOUTParametro("p_valida", OracleDbType.Varchar2, 300);

                DataRow dr = objComando.ejecutarRegistroSP();
                return dr["p_valida"].ToString();
            }

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR p_valida_fechas_habil : " + ex.Message);
        }
    }
    #endregion

}