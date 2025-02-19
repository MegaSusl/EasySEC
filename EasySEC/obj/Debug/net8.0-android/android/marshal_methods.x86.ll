; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [310 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [614 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 230
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 264
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 39485524, ; 6: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42639949, ; 7: System.Threading.Thread => 0x28aa24d => 145
	i32 66541672, ; 8: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 9: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 305
	i32 68219467, ; 10: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 11: Microsoft.Maui.Graphics.dll => 0x44bb714 => 188
	i32 82292897, ; 12: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 101534019, ; 13: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 248
	i32 117431740, ; 14: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 15: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 248
	i32 122350210, ; 16: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 17: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 268
	i32 142721839, ; 18: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 19: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 20: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 21: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 204
	i32 176265551, ; 22: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 23: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 250
	i32 184328833, ; 24: System.ValueTuple.dll => 0xafca281 => 151
	i32 195452805, ; 25: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 302
	i32 199333315, ; 26: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 303
	i32 205061960, ; 27: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 28: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 202
	i32 220171995, ; 29: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 30: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 224
	i32 230752869, ; 31: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 32: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 33: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 34: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 261689757, ; 35: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 207
	i32 276479776, ; 36: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 37: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 226
	i32 280482487, ; 38: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 223
	i32 280992041, ; 39: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 274
	i32 291076382, ; 40: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 298918909, ; 41: System.Net.Ping.dll => 0x11d123fd => 69
	i32 317674968, ; 42: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 302
	i32 318968648, ; 43: Xamarin.AndroidX.Activity.dll => 0x13031348 => 193
	i32 321597661, ; 44: System.Numerics => 0x132b30dd => 83
	i32 336156722, ; 45: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 287
	i32 342366114, ; 46: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 225
	i32 356389973, ; 47: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 286
	i32 360082299, ; 48: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 49: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 50: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 51: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 52: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 53: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 54: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 55: _Microsoft.Android.Resource.Designer => 0x17969339 => 306
	i32 403441872, ; 56: WindowsBase => 0x180c08d0 => 165
	i32 435591531, ; 57: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 298
	i32 441335492, ; 58: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 208
	i32 442565967, ; 59: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 60: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 221
	i32 451504562, ; 61: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 62: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 63: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 64: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 65: System.dll => 0x1bff388e => 164
	i32 476646585, ; 66: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 223
	i32 486930444, ; 67: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 236
	i32 498788369, ; 68: System.ObjectModel => 0x1dbae811 => 84
	i32 500358224, ; 69: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 285
	i32 503918385, ; 70: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 279
	i32 513247710, ; 71: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 182
	i32 526420162, ; 72: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 73: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 268
	i32 530272170, ; 74: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 539058512, ; 75: Microsoft.Extensions.Logging => 0x20216150 => 178
	i32 540030774, ; 76: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 77: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 78: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 79: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 80: Jsr305Binding => 0x213954e7 => 261
	i32 569601784, ; 81: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 259
	i32 577335427, ; 82: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 592146354, ; 83: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 293
	i32 601371474, ; 84: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 85: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 86: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 627609679, ; 87: Xamarin.AndroidX.CustomView => 0x2568904f => 213
	i32 627931235, ; 88: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 291
	i32 639843206, ; 89: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 219
	i32 643868501, ; 90: System.Net => 0x2660a755 => 81
	i32 662205335, ; 91: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 92: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 255
	i32 666292255, ; 93: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 200
	i32 672442732, ; 94: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 95: System.Net.Security => 0x28bdabca => 73
	i32 688181140, ; 96: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 273
	i32 690569205, ; 97: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 98: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 270
	i32 693804605, ; 99: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 100: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 101: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 265
	i32 700358131, ; 102: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 706645707, ; 103: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 288
	i32 709557578, ; 104: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 276
	i32 720511267, ; 105: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 269
	i32 722857257, ; 106: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 735137430, ; 107: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 752232764, ; 108: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 109: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 190
	i32 759454413, ; 110: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 111: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 112: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 113: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 297
	i32 789151979, ; 114: Microsoft.Extensions.Options => 0x2f0980eb => 181
	i32 790371945, ; 115: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 214
	i32 804715423, ; 116: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 117: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 228
	i32 823281589, ; 118: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 119: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 120: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 121: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 122: Xamarin.AndroidX.Print => 0x3246f6cd => 241
	i32 873119928, ; 123: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 124: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 125: System.Net.Http.Json => 0x3463c971 => 63
	i32 904024072, ; 126: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 127: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 926902833, ; 128: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 300
	i32 928116545, ; 129: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 264
	i32 952186615, ; 130: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 956575887, ; 131: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 269
	i32 966729478, ; 132: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 262
	i32 967690846, ; 133: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 225
	i32 975236339, ; 134: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 135: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 136: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 137: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 992768348, ; 138: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 139: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 1001831731, ; 140: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 141: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 245
	i32 1019214401, ; 142: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 143: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 177
	i32 1029334545, ; 144: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 275
	i32 1031528504, ; 145: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 263
	i32 1035644815, ; 146: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 198
	i32 1036536393, ; 147: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1044663988, ; 148: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1052210849, ; 149: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 232
	i32 1067306892, ; 150: GoogleGson => 0x3f9dcf8c => 173
	i32 1082857460, ; 151: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 152: Xamarin.Kotlin.StdLib => 0x409e66d8 => 266
	i32 1098259244, ; 153: System => 0x41761b2c => 164
	i32 1118262833, ; 154: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 288
	i32 1121599056, ; 155: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 231
	i32 1127624469, ; 156: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 180
	i32 1149092582, ; 157: Xamarin.AndroidX.Window => 0x447dc2e6 => 258
	i32 1168523401, ; 158: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 294
	i32 1170634674, ; 159: System.Web.dll => 0x45c677b2 => 153
	i32 1175144683, ; 160: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 254
	i32 1178241025, ; 161: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 239
	i32 1203215381, ; 162: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 292
	i32 1204270330, ; 163: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 200
	i32 1208641965, ; 164: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1219128291, ; 165: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1234928153, ; 166: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 290
	i32 1243150071, ; 167: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 259
	i32 1253011324, ; 168: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 169: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 274
	i32 1264511973, ; 170: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 249
	i32 1267360935, ; 171: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 253
	i32 1273260888, ; 172: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 205
	i32 1275534314, ; 173: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 270
	i32 1278448581, ; 174: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 197
	i32 1293217323, ; 175: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 216
	i32 1309188875, ; 176: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1322716291, ; 177: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 258
	i32 1324164729, ; 178: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 179: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1364015309, ; 180: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 181: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 304
	i32 1376866003, ; 182: Xamarin.AndroidX.SavedState => 0x52114ed3 => 245
	i32 1379779777, ; 183: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1402170036, ; 184: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 185: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 209
	i32 1408764838, ; 186: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 187: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 188: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 189: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 272
	i32 1434145427, ; 190: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 191: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 262
	i32 1439761251, ; 192: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 193: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 194: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1457743152, ; 195: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 196: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1461004990, ; 197: es\Microsoft.Maui.Controls.resources => 0x57152abe => 278
	i32 1461234159, ; 198: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 199: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 200: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 201: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 199
	i32 1470490898, ; 202: Microsoft.Extensions.Primitives => 0x57a5e912 => 182
	i32 1479771757, ; 203: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 204: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 205: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 206: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 246
	i32 1493001747, ; 207: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 282
	i32 1514721132, ; 208: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 277
	i32 1536373174, ; 209: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 210: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 211: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1550322496, ; 212: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1551623176, ; 213: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 297
	i32 1565862583, ; 214: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 215: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 216: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 217: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 218: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 215
	i32 1592978981, ; 219: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 220: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 263
	i32 1601112923, ; 221: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 222: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 223: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 224: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 235
	i32 1622358360, ; 225: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 226: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 257
	i32 1635184631, ; 227: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 219
	i32 1636350590, ; 228: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 212
	i32 1639515021, ; 229: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 230: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 231: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 232: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 233: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 251
	i32 1658251792, ; 234: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 260
	i32 1670060433, ; 235: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 207
	i32 1675553242, ; 236: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 237: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 238: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 239: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1691477237, ; 240: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 241: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 242: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 267
	i32 1701541528, ; 243: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 244: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 228
	i32 1726116996, ; 245: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 246: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 247: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 203
	i32 1736233607, ; 248: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 295
	i32 1743415430, ; 249: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 273
	i32 1744735666, ; 250: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746316138, ; 251: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 252: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 253: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1763938596, ; 254: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 255: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 256: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 250
	i32 1770582343, ; 257: Microsoft.Extensions.Logging.dll => 0x6988f147 => 178
	i32 1776026572, ; 258: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 259: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 260: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 261: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 289
	i32 1788241197, ; 262: Xamarin.AndroidX.Fragment => 0x6a96652d => 221
	i32 1793755602, ; 263: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 281
	i32 1808609942, ; 264: Xamarin.AndroidX.Loader => 0x6bcd3296 => 235
	i32 1813058853, ; 265: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 266
	i32 1813201214, ; 266: Xamarin.Google.Android.Material => 0x6c13413e => 260
	i32 1818569960, ; 267: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 240
	i32 1818787751, ; 268: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 269: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 270: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 271: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 179
	i32 1842015223, ; 272: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 301
	i32 1847515442, ; 273: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 190
	i32 1853025655, ; 274: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 298
	i32 1858542181, ; 275: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 276: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1875935024, ; 277: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 280
	i32 1879696579, ; 278: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 279: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 201
	i32 1888955245, ; 280: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 281: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1898237753, ; 282: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 283: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 284: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 285: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1956758971, ; 286: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 287: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 247
	i32 1968388702, ; 288: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 174
	i32 1983156543, ; 289: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 267
	i32 1985761444, ; 290: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 192
	i32 2003115576, ; 291: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 277
	i32 2011961780, ; 292: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 293: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 232
	i32 2025202353, ; 294: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 272
	i32 2031763787, ; 295: Xamarin.Android.Glide => 0x791a414b => 189
	i32 2045470958, ; 296: System.Private.Xml => 0x79eb68ee => 88
	i32 2055257422, ; 297: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 227
	i32 2060060697, ; 298: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 299: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 276
	i32 2070888862, ; 300: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2079903147, ; 301: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 302: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2127167465, ; 303: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 304: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 305: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 306: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 307: Microsoft.Maui => 0x80bd55ad => 186
	i32 2169148018, ; 308: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 284
	i32 2181898931, ; 309: Microsoft.Extensions.Options.dll => 0x820d22b3 => 181
	i32 2192057212, ; 310: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 179
	i32 2193016926, ; 311: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2201107256, ; 312: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 271
	i32 2201231467, ; 313: System.Net.Http => 0x8334206b => 64
	i32 2207618523, ; 314: it\Microsoft.Maui.Controls.resources => 0x839595db => 286
	i32 2217644978, ; 315: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 254
	i32 2222056684, ; 316: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2229397674, ; 317: EasySEC => 0x84e1e8aa => 0
	i32 2244775296, ; 318: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 236
	i32 2252106437, ; 319: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2256313426, ; 320: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 321: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 322: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 175
	i32 2267999099, ; 323: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 191
	i32 2270573516, ; 324: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 280
	i32 2279755925, ; 325: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 243
	i32 2293034957, ; 326: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 327: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 328: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 329: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 290
	i32 2305521784, ; 330: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 331: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 195
	i32 2320631194, ; 332: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 333: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 334: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 335: System.Net.Primitives => 0x8c40e0db => 70
	i32 2368005991, ; 336: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2371007202, ; 337: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 174
	i32 2378619854, ; 338: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 339: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 340: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 285
	i32 2401565422, ; 341: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 342: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 218
	i32 2421380589, ; 343: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 344: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 205
	i32 2427813419, ; 345: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 282
	i32 2435356389, ; 346: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 347: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 348: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 349: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 350: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465532216, ; 351: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 208
	i32 2471841756, ; 352: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 353: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 354: Microsoft.Maui.Controls => 0x93dba8a1 => 184
	i32 2483903535, ; 355: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 356: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 357: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 358: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 359: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 230
	i32 2522472828, ; 360: Xamarin.Android.Glide.dll => 0x9659e17c => 189
	i32 2538310050, ; 361: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 362: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 283
	i32 2562349572, ; 363: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 364: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2581783588, ; 365: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 231
	i32 2581819634, ; 366: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 253
	i32 2585220780, ; 367: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 368: System.Net.Ping => 0x9a20430d => 69
	i32 2589602615, ; 369: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2593496499, ; 370: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 292
	i32 2605712449, ; 371: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 271
	i32 2615233544, ; 372: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 222
	i32 2616218305, ; 373: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 180
	i32 2617129537, ; 374: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 375: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 376: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 212
	i32 2624644809, ; 377: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 217
	i32 2626831493, ; 378: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 287
	i32 2627185994, ; 379: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 380: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 381: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 226
	i32 2663391936, ; 382: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 191
	i32 2663698177, ; 383: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 384: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 385: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 386: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 387: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2693849962, ; 388: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 389: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 251
	i32 2715334215, ; 390: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 391: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 392: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 393: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 394: Xamarin.AndroidX.Activity => 0xa2e0939b => 193
	i32 2735172069, ; 395: System.Threading.Channels => 0xa30769e5 => 139
	i32 2737747696, ; 396: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 199
	i32 2740948882, ; 397: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 398: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 399: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 293
	i32 2758225723, ; 400: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 185
	i32 2764765095, ; 401: Microsoft.Maui.dll => 0xa4caf7a7 => 186
	i32 2765824710, ; 402: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 403: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 265
	i32 2778768386, ; 404: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 256
	i32 2779977773, ; 405: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 244
	i32 2785988530, ; 406: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 299
	i32 2788224221, ; 407: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 222
	i32 2801831435, ; 408: Microsoft.Maui.Graphics => 0xa7008e0b => 188
	i32 2803228030, ; 409: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2806116107, ; 410: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 278
	i32 2810250172, ; 411: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 209
	i32 2819470561, ; 412: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 413: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 414: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 244
	i32 2824502124, ; 415: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2831556043, ; 416: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 291
	i32 2838993487, ; 417: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 233
	i32 2849599387, ; 418: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853208004, ; 419: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 256
	i32 2855708567, ; 420: Xamarin.AndroidX.Transition => 0xaa36a797 => 252
	i32 2861098320, ; 421: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 422: Microsoft.Maui.Essentials => 0xaa8a4878 => 187
	i32 2870099610, ; 423: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 194
	i32 2875164099, ; 424: Jsr305Binding.dll => 0xab5f85c3 => 261
	i32 2875220617, ; 425: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 426: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 220
	i32 2887636118, ; 427: System.Net.dll => 0xac1dd496 => 81
	i32 2899753641, ; 428: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 429: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 430: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 431: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 432: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2916838712, ; 433: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 257
	i32 2919462931, ; 434: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 435: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 196
	i32 2936416060, ; 436: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 437: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 438: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2959614098, ; 439: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 440: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2972252294, ; 441: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 442: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 216
	i32 2987532451, ; 443: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 247
	i32 2996846495, ; 444: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 229
	i32 3016983068, ; 445: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 249
	i32 3023353419, ; 446: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 447: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 224
	i32 3038032645, ; 448: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 306
	i32 3056245963, ; 449: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 246
	i32 3057625584, ; 450: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 237
	i32 3059408633, ; 451: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 452: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 453: System.Threading.Tasks => 0xb755818f => 144
	i32 3077302341, ; 454: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 284
	i32 3090735792, ; 455: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 456: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 457: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 458: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 459: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 460: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 461: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 462: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 463: GoogleGson.dll => 0xbba64c02 => 173
	i32 3159123045, ; 464: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 465: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 466: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 238
	i32 3192346100, ; 467: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 468: System.Web => 0xbe592c0c => 153
	i32 3204380047, ; 469: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 470: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 471: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 215
	i32 3220365878, ; 472: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 473: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3251039220, ; 474: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 475: Xamarin.AndroidX.CardView => 0xc235e84d => 203
	i32 3265493905, ; 476: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 477: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 478: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 479: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 480: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 481: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 482: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 483: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 484: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 279
	i32 3316684772, ; 485: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 486: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 213
	i32 3317144872, ; 487: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 488: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 201
	i32 3345895724, ; 489: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 242
	i32 3346324047, ; 490: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 239
	i32 3357674450, ; 491: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 296
	i32 3358260929, ; 492: System.Text.Json => 0xc82afec1 => 137
	i32 3362336904, ; 493: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 194
	i32 3362522851, ; 494: Xamarin.AndroidX.Core => 0xc86c06e3 => 210
	i32 3366347497, ; 495: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 496: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 243
	i32 3381016424, ; 497: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 275
	i32 3395150330, ; 498: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 499: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 500: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 214
	i32 3428513518, ; 501: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 176
	i32 3429136800, ; 502: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 503: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 504: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 217
	i32 3445260447, ; 505: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 506: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 183
	i32 3463511458, ; 507: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 283
	i32 3471940407, ; 508: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 509: Mono.Android => 0xcf3163e6 => 171
	i32 3479583265, ; 510: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 296
	i32 3484440000, ; 511: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 295
	i32 3485117614, ; 512: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 513: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 514: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 206
	i32 3509114376, ; 515: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 516: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 517: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 518: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3560100363, ; 519: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 520: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3580758918, ; 521: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 303
	i32 3590579538, ; 522: EasySEC.dll => 0xd603e552 => 0
	i32 3597029428, ; 523: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 192
	i32 3598340787, ; 524: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 525: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 526: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 527: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 241
	i32 3633644679, ; 528: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 196
	i32 3638274909, ; 529: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 530: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 227
	i32 3643446276, ; 531: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 300
	i32 3643854240, ; 532: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 238
	i32 3645089577, ; 533: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 534: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 175
	i32 3660523487, ; 535: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 536: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3682565725, ; 537: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 202
	i32 3684561358, ; 538: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 206
	i32 3697841164, ; 539: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 305
	i32 3700866549, ; 540: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 541: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 211
	i32 3716563718, ; 542: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 543: Xamarin.AndroidX.Annotation => 0xdda814c6 => 195
	i32 3724971120, ; 544: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 237
	i32 3732100267, ; 545: System.Net.NameResolution => 0xde7354ab => 67
	i32 3737834244, ; 546: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 547: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 548: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3786282454, ; 549: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 204
	i32 3792276235, ; 550: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 551: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 183
	i32 3802395368, ; 552: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3819260425, ; 553: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 554: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 555: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 556: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 177
	i32 3844307129, ; 557: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 558: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 559: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 560: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 561: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3885497537, ; 562: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 563: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 252
	i32 3888767677, ; 564: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 242
	i32 3889960447, ; 565: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 304
	i32 3896106733, ; 566: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 567: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 210
	i32 3901907137, ; 568: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 569: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 570: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 255
	i32 3928044579, ; 571: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 572: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 573: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 240
	i32 3945713374, ; 574: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 575: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 576: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 198
	i32 3959773229, ; 577: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 229
	i32 3980434154, ; 578: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 299
	i32 3987592930, ; 579: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 281
	i32 4003436829, ; 580: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 581: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 197
	i32 4025784931, ; 582: System.Memory => 0xeff49a63 => 62
	i32 4046471985, ; 583: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 185
	i32 4054681211, ; 584: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 585: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 586: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4094352644, ; 587: Microsoft.Maui.Essentials.dll => 0xf40add04 => 187
	i32 4099507663, ; 588: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 589: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 590: Xamarin.AndroidX.Emoji2 => 0xf479582c => 218
	i32 4102112229, ; 591: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 294
	i32 4125707920, ; 592: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 289
	i32 4126470640, ; 593: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 176
	i32 4127667938, ; 594: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 595: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 596: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 597: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 301
	i32 4151237749, ; 598: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 599: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 600: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 601: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 602: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 603: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 234
	i32 4185676441, ; 604: System.Security => 0xf97c5a99 => 130
	i32 4196529839, ; 605: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 606: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4256097574, ; 607: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 211
	i32 4258378803, ; 608: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 233
	i32 4260525087, ; 609: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 610: Microsoft.Maui.Controls.dll => 0xfea12dee => 184
	i32 4274976490, ; 611: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 612: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 234
	i32 4294763496 ; 613: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 220
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [614 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 230, ; 3
	i32 264, ; 4
	i32 48, ; 5
	i32 80, ; 6
	i32 145, ; 7
	i32 30, ; 8
	i32 305, ; 9
	i32 124, ; 10
	i32 188, ; 11
	i32 102, ; 12
	i32 248, ; 13
	i32 107, ; 14
	i32 248, ; 15
	i32 139, ; 16
	i32 268, ; 17
	i32 77, ; 18
	i32 124, ; 19
	i32 13, ; 20
	i32 204, ; 21
	i32 132, ; 22
	i32 250, ; 23
	i32 151, ; 24
	i32 302, ; 25
	i32 303, ; 26
	i32 18, ; 27
	i32 202, ; 28
	i32 26, ; 29
	i32 224, ; 30
	i32 1, ; 31
	i32 59, ; 32
	i32 42, ; 33
	i32 91, ; 34
	i32 207, ; 35
	i32 147, ; 36
	i32 226, ; 37
	i32 223, ; 38
	i32 274, ; 39
	i32 54, ; 40
	i32 69, ; 41
	i32 302, ; 42
	i32 193, ; 43
	i32 83, ; 44
	i32 287, ; 45
	i32 225, ; 46
	i32 286, ; 47
	i32 131, ; 48
	i32 55, ; 49
	i32 149, ; 50
	i32 74, ; 51
	i32 145, ; 52
	i32 62, ; 53
	i32 146, ; 54
	i32 306, ; 55
	i32 165, ; 56
	i32 298, ; 57
	i32 208, ; 58
	i32 12, ; 59
	i32 221, ; 60
	i32 125, ; 61
	i32 152, ; 62
	i32 113, ; 63
	i32 166, ; 64
	i32 164, ; 65
	i32 223, ; 66
	i32 236, ; 67
	i32 84, ; 68
	i32 285, ; 69
	i32 279, ; 70
	i32 182, ; 71
	i32 150, ; 72
	i32 268, ; 73
	i32 60, ; 74
	i32 178, ; 75
	i32 51, ; 76
	i32 103, ; 77
	i32 114, ; 78
	i32 40, ; 79
	i32 261, ; 80
	i32 259, ; 81
	i32 120, ; 82
	i32 293, ; 83
	i32 52, ; 84
	i32 44, ; 85
	i32 119, ; 86
	i32 213, ; 87
	i32 291, ; 88
	i32 219, ; 89
	i32 81, ; 90
	i32 136, ; 91
	i32 255, ; 92
	i32 200, ; 93
	i32 8, ; 94
	i32 73, ; 95
	i32 273, ; 96
	i32 155, ; 97
	i32 270, ; 98
	i32 154, ; 99
	i32 92, ; 100
	i32 265, ; 101
	i32 45, ; 102
	i32 288, ; 103
	i32 276, ; 104
	i32 269, ; 105
	i32 109, ; 106
	i32 129, ; 107
	i32 25, ; 108
	i32 190, ; 109
	i32 72, ; 110
	i32 55, ; 111
	i32 46, ; 112
	i32 297, ; 113
	i32 181, ; 114
	i32 214, ; 115
	i32 22, ; 116
	i32 228, ; 117
	i32 86, ; 118
	i32 43, ; 119
	i32 160, ; 120
	i32 71, ; 121
	i32 241, ; 122
	i32 3, ; 123
	i32 42, ; 124
	i32 63, ; 125
	i32 16, ; 126
	i32 53, ; 127
	i32 300, ; 128
	i32 264, ; 129
	i32 105, ; 130
	i32 269, ; 131
	i32 262, ; 132
	i32 225, ; 133
	i32 34, ; 134
	i32 158, ; 135
	i32 85, ; 136
	i32 32, ; 137
	i32 12, ; 138
	i32 51, ; 139
	i32 56, ; 140
	i32 245, ; 141
	i32 36, ; 142
	i32 177, ; 143
	i32 275, ; 144
	i32 263, ; 145
	i32 198, ; 146
	i32 35, ; 147
	i32 58, ; 148
	i32 232, ; 149
	i32 173, ; 150
	i32 17, ; 151
	i32 266, ; 152
	i32 164, ; 153
	i32 288, ; 154
	i32 231, ; 155
	i32 180, ; 156
	i32 258, ; 157
	i32 294, ; 158
	i32 153, ; 159
	i32 254, ; 160
	i32 239, ; 161
	i32 292, ; 162
	i32 200, ; 163
	i32 29, ; 164
	i32 52, ; 165
	i32 290, ; 166
	i32 259, ; 167
	i32 5, ; 168
	i32 274, ; 169
	i32 249, ; 170
	i32 253, ; 171
	i32 205, ; 172
	i32 270, ; 173
	i32 197, ; 174
	i32 216, ; 175
	i32 85, ; 176
	i32 258, ; 177
	i32 61, ; 178
	i32 112, ; 179
	i32 57, ; 180
	i32 304, ; 181
	i32 245, ; 182
	i32 99, ; 183
	i32 19, ; 184
	i32 209, ; 185
	i32 111, ; 186
	i32 101, ; 187
	i32 102, ; 188
	i32 272, ; 189
	i32 104, ; 190
	i32 262, ; 191
	i32 71, ; 192
	i32 38, ; 193
	i32 32, ; 194
	i32 103, ; 195
	i32 73, ; 196
	i32 278, ; 197
	i32 9, ; 198
	i32 123, ; 199
	i32 46, ; 200
	i32 199, ; 201
	i32 182, ; 202
	i32 9, ; 203
	i32 43, ; 204
	i32 4, ; 205
	i32 246, ; 206
	i32 282, ; 207
	i32 277, ; 208
	i32 31, ; 209
	i32 138, ; 210
	i32 92, ; 211
	i32 93, ; 212
	i32 297, ; 213
	i32 49, ; 214
	i32 141, ; 215
	i32 112, ; 216
	i32 140, ; 217
	i32 215, ; 218
	i32 115, ; 219
	i32 263, ; 220
	i32 157, ; 221
	i32 76, ; 222
	i32 79, ; 223
	i32 235, ; 224
	i32 37, ; 225
	i32 257, ; 226
	i32 219, ; 227
	i32 212, ; 228
	i32 64, ; 229
	i32 138, ; 230
	i32 15, ; 231
	i32 116, ; 232
	i32 251, ; 233
	i32 260, ; 234
	i32 207, ; 235
	i32 48, ; 236
	i32 70, ; 237
	i32 80, ; 238
	i32 126, ; 239
	i32 94, ; 240
	i32 121, ; 241
	i32 267, ; 242
	i32 26, ; 243
	i32 228, ; 244
	i32 97, ; 245
	i32 28, ; 246
	i32 203, ; 247
	i32 295, ; 248
	i32 273, ; 249
	i32 149, ; 250
	i32 169, ; 251
	i32 4, ; 252
	i32 98, ; 253
	i32 33, ; 254
	i32 93, ; 255
	i32 250, ; 256
	i32 178, ; 257
	i32 21, ; 258
	i32 41, ; 259
	i32 170, ; 260
	i32 289, ; 261
	i32 221, ; 262
	i32 281, ; 263
	i32 235, ; 264
	i32 266, ; 265
	i32 260, ; 266
	i32 240, ; 267
	i32 2, ; 268
	i32 134, ; 269
	i32 111, ; 270
	i32 179, ; 271
	i32 301, ; 272
	i32 190, ; 273
	i32 298, ; 274
	i32 58, ; 275
	i32 95, ; 276
	i32 280, ; 277
	i32 39, ; 278
	i32 201, ; 279
	i32 25, ; 280
	i32 94, ; 281
	i32 89, ; 282
	i32 99, ; 283
	i32 10, ; 284
	i32 87, ; 285
	i32 100, ; 286
	i32 247, ; 287
	i32 174, ; 288
	i32 267, ; 289
	i32 192, ; 290
	i32 277, ; 291
	i32 7, ; 292
	i32 232, ; 293
	i32 272, ; 294
	i32 189, ; 295
	i32 88, ; 296
	i32 227, ; 297
	i32 154, ; 298
	i32 276, ; 299
	i32 33, ; 300
	i32 116, ; 301
	i32 82, ; 302
	i32 20, ; 303
	i32 11, ; 304
	i32 162, ; 305
	i32 3, ; 306
	i32 186, ; 307
	i32 284, ; 308
	i32 181, ; 309
	i32 179, ; 310
	i32 84, ; 311
	i32 271, ; 312
	i32 64, ; 313
	i32 286, ; 314
	i32 254, ; 315
	i32 143, ; 316
	i32 0, ; 317
	i32 236, ; 318
	i32 157, ; 319
	i32 41, ; 320
	i32 117, ; 321
	i32 175, ; 322
	i32 191, ; 323
	i32 280, ; 324
	i32 243, ; 325
	i32 131, ; 326
	i32 75, ; 327
	i32 66, ; 328
	i32 290, ; 329
	i32 172, ; 330
	i32 195, ; 331
	i32 143, ; 332
	i32 106, ; 333
	i32 151, ; 334
	i32 70, ; 335
	i32 156, ; 336
	i32 174, ; 337
	i32 121, ; 338
	i32 127, ; 339
	i32 285, ; 340
	i32 152, ; 341
	i32 218, ; 342
	i32 141, ; 343
	i32 205, ; 344
	i32 282, ; 345
	i32 20, ; 346
	i32 14, ; 347
	i32 135, ; 348
	i32 75, ; 349
	i32 59, ; 350
	i32 208, ; 351
	i32 167, ; 352
	i32 168, ; 353
	i32 184, ; 354
	i32 15, ; 355
	i32 74, ; 356
	i32 6, ; 357
	i32 23, ; 358
	i32 230, ; 359
	i32 189, ; 360
	i32 91, ; 361
	i32 283, ; 362
	i32 1, ; 363
	i32 136, ; 364
	i32 231, ; 365
	i32 253, ; 366
	i32 134, ; 367
	i32 69, ; 368
	i32 146, ; 369
	i32 292, ; 370
	i32 271, ; 371
	i32 222, ; 372
	i32 180, ; 373
	i32 88, ; 374
	i32 96, ; 375
	i32 212, ; 376
	i32 217, ; 377
	i32 287, ; 378
	i32 31, ; 379
	i32 45, ; 380
	i32 226, ; 381
	i32 191, ; 382
	i32 109, ; 383
	i32 158, ; 384
	i32 35, ; 385
	i32 22, ; 386
	i32 114, ; 387
	i32 57, ; 388
	i32 251, ; 389
	i32 144, ; 390
	i32 118, ; 391
	i32 120, ; 392
	i32 110, ; 393
	i32 193, ; 394
	i32 139, ; 395
	i32 199, ; 396
	i32 54, ; 397
	i32 105, ; 398
	i32 293, ; 399
	i32 185, ; 400
	i32 186, ; 401
	i32 133, ; 402
	i32 265, ; 403
	i32 256, ; 404
	i32 244, ; 405
	i32 299, ; 406
	i32 222, ; 407
	i32 188, ; 408
	i32 159, ; 409
	i32 278, ; 410
	i32 209, ; 411
	i32 163, ; 412
	i32 132, ; 413
	i32 244, ; 414
	i32 161, ; 415
	i32 291, ; 416
	i32 233, ; 417
	i32 140, ; 418
	i32 256, ; 419
	i32 252, ; 420
	i32 169, ; 421
	i32 187, ; 422
	i32 194, ; 423
	i32 261, ; 424
	i32 40, ; 425
	i32 220, ; 426
	i32 81, ; 427
	i32 56, ; 428
	i32 37, ; 429
	i32 97, ; 430
	i32 166, ; 431
	i32 172, ; 432
	i32 257, ; 433
	i32 82, ; 434
	i32 196, ; 435
	i32 98, ; 436
	i32 30, ; 437
	i32 159, ; 438
	i32 18, ; 439
	i32 127, ; 440
	i32 119, ; 441
	i32 216, ; 442
	i32 247, ; 443
	i32 229, ; 444
	i32 249, ; 445
	i32 165, ; 446
	i32 224, ; 447
	i32 306, ; 448
	i32 246, ; 449
	i32 237, ; 450
	i32 170, ; 451
	i32 16, ; 452
	i32 144, ; 453
	i32 284, ; 454
	i32 125, ; 455
	i32 118, ; 456
	i32 38, ; 457
	i32 115, ; 458
	i32 47, ; 459
	i32 142, ; 460
	i32 117, ; 461
	i32 34, ; 462
	i32 173, ; 463
	i32 95, ; 464
	i32 53, ; 465
	i32 238, ; 466
	i32 129, ; 467
	i32 153, ; 468
	i32 24, ; 469
	i32 161, ; 470
	i32 215, ; 471
	i32 148, ; 472
	i32 104, ; 473
	i32 89, ; 474
	i32 203, ; 475
	i32 60, ; 476
	i32 142, ; 477
	i32 100, ; 478
	i32 5, ; 479
	i32 13, ; 480
	i32 122, ; 481
	i32 135, ; 482
	i32 28, ; 483
	i32 279, ; 484
	i32 72, ; 485
	i32 213, ; 486
	i32 24, ; 487
	i32 201, ; 488
	i32 242, ; 489
	i32 239, ; 490
	i32 296, ; 491
	i32 137, ; 492
	i32 194, ; 493
	i32 210, ; 494
	i32 168, ; 495
	i32 243, ; 496
	i32 275, ; 497
	i32 101, ; 498
	i32 123, ; 499
	i32 214, ; 500
	i32 176, ; 501
	i32 163, ; 502
	i32 167, ; 503
	i32 217, ; 504
	i32 39, ; 505
	i32 183, ; 506
	i32 283, ; 507
	i32 17, ; 508
	i32 171, ; 509
	i32 296, ; 510
	i32 295, ; 511
	i32 137, ; 512
	i32 150, ; 513
	i32 206, ; 514
	i32 155, ; 515
	i32 130, ; 516
	i32 19, ; 517
	i32 65, ; 518
	i32 147, ; 519
	i32 47, ; 520
	i32 303, ; 521
	i32 0, ; 522
	i32 192, ; 523
	i32 79, ; 524
	i32 61, ; 525
	i32 106, ; 526
	i32 241, ; 527
	i32 196, ; 528
	i32 49, ; 529
	i32 227, ; 530
	i32 300, ; 531
	i32 238, ; 532
	i32 14, ; 533
	i32 175, ; 534
	i32 68, ; 535
	i32 171, ; 536
	i32 202, ; 537
	i32 206, ; 538
	i32 305, ; 539
	i32 78, ; 540
	i32 211, ; 541
	i32 108, ; 542
	i32 195, ; 543
	i32 237, ; 544
	i32 67, ; 545
	i32 63, ; 546
	i32 27, ; 547
	i32 160, ; 548
	i32 204, ; 549
	i32 10, ; 550
	i32 183, ; 551
	i32 11, ; 552
	i32 78, ; 553
	i32 126, ; 554
	i32 83, ; 555
	i32 177, ; 556
	i32 66, ; 557
	i32 107, ; 558
	i32 65, ; 559
	i32 128, ; 560
	i32 122, ; 561
	i32 77, ; 562
	i32 252, ; 563
	i32 242, ; 564
	i32 304, ; 565
	i32 8, ; 566
	i32 210, ; 567
	i32 2, ; 568
	i32 44, ; 569
	i32 255, ; 570
	i32 156, ; 571
	i32 128, ; 572
	i32 240, ; 573
	i32 23, ; 574
	i32 133, ; 575
	i32 198, ; 576
	i32 229, ; 577
	i32 299, ; 578
	i32 281, ; 579
	i32 29, ; 580
	i32 197, ; 581
	i32 62, ; 582
	i32 185, ; 583
	i32 90, ; 584
	i32 87, ; 585
	i32 148, ; 586
	i32 187, ; 587
	i32 36, ; 588
	i32 86, ; 589
	i32 218, ; 590
	i32 294, ; 591
	i32 289, ; 592
	i32 176, ; 593
	i32 50, ; 594
	i32 6, ; 595
	i32 90, ; 596
	i32 301, ; 597
	i32 21, ; 598
	i32 162, ; 599
	i32 96, ; 600
	i32 50, ; 601
	i32 113, ; 602
	i32 234, ; 603
	i32 130, ; 604
	i32 76, ; 605
	i32 27, ; 606
	i32 211, ; 607
	i32 233, ; 608
	i32 7, ; 609
	i32 184, ; 610
	i32 110, ; 611
	i32 234, ; 612
	i32 220 ; 613
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ a8cd27e430e55df3e3c1e3a43d35c11d9512a2db"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
