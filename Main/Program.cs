using System;
using System.Threading;

namespace Main
{
    class Program
    {
        static void Main(string[] args)
        {
            while(true) {
                String timestamp = DateTime.UtcNow.ToString("yyyy-MM-ddTHH:mm:ssZ");
                String message = String.Format("[{0}] Heartbeat", timestamp);
                Console.WriteLine(message);
                Thread.Sleep(10000);
            }
        }
    }
}
