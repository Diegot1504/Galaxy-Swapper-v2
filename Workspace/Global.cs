﻿using System;

namespace Galaxy_Swapper_v2.Workspace
{
    public static class Global
    {
        public const string Version = "1.21";
        public const string ApiVersion = "1.14";
        public static string Discord = "https://galaxyswapperv2.com/Discord.php";
        public static string Website = "https://galaxyswapperv2.com";
        public static string Download = "https://galaxyswapperv2.com/Downloads/InGame.php";
        public static string Key = "https://galaxyswapperv2.com/Downloads/Discord.php";

        public class CustomException : Exception
        {
            public CustomException(string message) : base(message)
            {
            }

            public CustomException(string message, Exception innerException) : base(message, innerException)
            {
            }
        }
    }
}
