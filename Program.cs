using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Net;

using System.Runtime.InteropServices;
Using Newtonsoft.Json;



namespace wwpc

{
    class Program
    {
        [DllImport("user32.dll", CharSet = CharSet.Auto)] 
        static extern Int32 SystemParametersInfo(UInt32 action, UInt32 uParam, String vParam, UInt32 winIni);

        static void Main(string[] args)
        {
            // Change to exe's directory so we put the image where we are safe
            String CurrentDir = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);
            Directory.SetCurrentDirectory(CurrentDir);


            // Let's download the new image
            using (WebClient client = new WebClient())
            {
                var str = client.DownloadString("https://peapix.com/bing/feed");
                dynamic json = JsonConvert.DeserializeObject(str);
                client.DownloadFile(json[0]["fullUrl"], "chris.jpg");
            }

            // .. and change wallpaper!
            SystemParametersInfo (0x14, 0, CurrentDir + "\\chris.jpg", 0x01 | 0x02);

        }
    }
}
