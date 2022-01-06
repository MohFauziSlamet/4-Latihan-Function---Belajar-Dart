/*
Fungsi (function) adalah sekumpulan statement / perintah / atau kode program yang independen(berdiri sendiri)
yang memiliki nama , yang bertugas melakukan hal yang spesifik tertentu.

Fungsi dapat (artinya opsional) mengembalikan nilai pada pemanggilnya , jika fungsi
tidak mengembalikan apapun , maka tipe datanya adalah void.


 */

// Fungsi sederhana
import 'dart:io';

double luasSegiEmpat(double panjang, double lebar) {
  double hasil;
  hasil = panjang * lebar;
  return hasil;
}

// fungsi yang tidak mengembalikan apapun disebut void
void sapaPenonton() {
  print('Halo kalian semua');
}

/*
Opsional parameter , artinya parameter fungsi bisa di isi atau tidak. dan tidak meniimbulkan error.
Fungsi opsional parameter dibagi menjadi 3 yaitu
1 Named Parameters dengan tanda{}
2 Posisional Parameter dengang tanda []
3 Default Parameter Values  dengan tanda = untuk memberikan nilai pada optional parameter.
jika optional tidak diberikan nilai , maka default nya akan bernilai null
Aroow syntax / lambda expresion / fat arrow expression*/

/*
Named Parameters
Menggunakan simbol {} untuk membuat optional-named parameter

keunggulan named parameter
kita bisa langsung mengisi parameter ke 4, tanpa harus mengisi parameter 3 terlebih dahulu
jadi bisa lebih flexibel

kekurangan named parameter
ketika akan mengisi parameter named , kita diwajibkan menulis nama variabelnya terlebih dahulu.
jadi lebih rumit dibandingakan positional parameter yang bisa langsung di isi nilai.
*/
say(String from, String massage, {String to, String appName}) {
  return from +
      ' bilang ' +
      massage +
      ((to != null) ? " ke " + to : "") +
      ((appName != null) ? " melalui " + appName : "");
}

/*
Posisional Parameter
Menggunakan simbol [] untuk membuat optional-positional parameter.

Posisional parameter tidak bisa melompat ke parameter nomer 4 sebelum nomer 3 ter isi terlebih dahulu,
dikarenakan dart membaca nilai sesuai dengan posisi dari urutan parameter nya. jadi gak bisa lompat parameter.

kalau mau mengisi yang ke 4 , wajib mengisi yang ke 3
 */
say2(String from, String massage, [String to, String appName]) {
  return from +
      ' bilang ' +
      massage +
      ((to != null) ? " ke " + to : "") +
      ((appName != null) ? " melalui " + appName : "");
}

/*
Default parameter value
Menggunakan simbol = untuk memberikan nilai default pada optional parameter.
Jika optional parameter tidak diberikan nilai default , maka nila defaultnya adalah null.
default patameter bisa digabungkan dengan named parameter atau positional parameter
 */
sayDefaultParameter(String from, String massage,
    {String to, String appName = "whatsapp"}) {
  return from +
      ' bilang ' +
      massage +
      ((to != null) ? " ke " + to : "") +
      ((appName != null) ? " melalui " + appName : "");
}

/*
Didalam dart , ada juga yang namanya Arrow syntax / lambda expresion / fat arrow expression
yang menggunkan lambang => untuk menyingkat sebuah fungsi yang mengembalikan nilai menjadi hanya satu 
baris perintah.
tanda panah ( => ) ini artinya me return fungsi.
contoh 
int add(int number1, int number2){
  return number1 + number2
} 

menjadi

int add(int number1, int number2) => number1 + number2;

perintah yang diantara => dengan ; , hanya boleh berupa expresion(perintah / kode progrman yang memiliki nilai)

 */
double luasPersegiPanjang(double panjang, double lebar) => panjang * lebar;

/*
Didalam bahasa Dart
Fungsi adalah first class object
artinya
fungsi dapat disimpan dalam sebuah identifier / variabel
fungsi dapat dijadikan sebagai parameter
fungsi dapat dijadikan sebagai nilai kembalian
 */

/*
Didalam bahasa Dart
Ada yang namanya Anonymous Function
Anonymous Function adalah fungsi yang tidak memiliki nama. 
biasanya dipakai pada fungsi yang tidak signifikan . hanya sekali penggunaan 
*/
int doMathOperator(int number1, int number2, Function Opertor) {
  return Opertor(number1, number2);
}

// untuk menegaskan bahwa fungsi harus bernilai int , dapat dituliskan type data pada parameter fungsinya, agar lebih yakin
// dan parameter wajib 2
int doMathOperator2(int number1, int number2, Function(int, int) Opertor) {
  return Opertor(number1, number2);
}

void main(List<String> arguments) {
  print('Hello world:');
  print("==========================================");
  print("Fungsi sederhana dengan penampung nilai");
  double p, l, luas;
  stdout.write('Masukan Panjang = ');
  p = double.tryParse(stdin.readLineSync());
  stdout.write('Masukan Lebar = ');
  l = double.tryParse(stdin.readLineSync());

  luas = luasSegiEmpat(p, l);
  stdout.write('Hasil Luas = ' + luas.toString());
  print('\n');

  //Fungsi juga bisa langsung dipanggil dalam method print , tanpa harus ditampung dahulu
  print("==========================================");
  print("Fungsi sederhana tanpa penampun nilai");
  print("Hasil luas = " + luasSegiEmpat(p, l).toString());
  print('\n');

  //fungsi void
  print("==========================================");
  print("Fungsi tanpa kembalian atau void");
  stdout.write("Memanggil fungsi void = ");
  sapaPenonton();
  print("\n");

  //fungsi opsional named parameter
  print("==========================================");
  print("Fungsi opsional named parameter");
  stdout.write("Memanggil opsional named parameter =  \n");
  print(say("Fauzi", "Sayang", to: "mauludy", appName: " Whatsapp"));
  print("\n");

  // meskipun parameter yang lain tidak dipakai juga tidak masalah.
  stdout.write("Memanggil opsional named parameter =  \n");
  print(say("Fauzi", "Sayang", appName: " Whatsapp"));
  print("\n");

  stdout.write("Memanggil opsional named parameter =  \n");
  print(say("Fauzi", "Sayang", to: "mauludy"));
  print("\n");

// atau tidak dipakai sama sekali juga tidak apa apa yang bagian optional parameter
  stdout.write("Memanggil opsional named parameter =  \n");
  print(say("Fauzi", "Sayang"));
  print("\n");

  //fungsi opsional positional parameter
  print("==========================================");
  print("Fungsi opsional positional parameter");
  stdout.write("Memanggil opsional named parameter =  \n");
  print(say2("Fauzi", "Sayang", "mauludy", " Whatsapp"));
  print("\n");

  // meskipun parameter yang lain tidak dipakai juga tidak masalah.
  stdout.write("Memanggil opsional positional parameter =  \n");
  // point ke tiga akan tetap masuk pada parameter ke 3 , tidak bisa lompat ke parameter ke 4
  print(say2("Fauzi", "Sayang", " Whatsapp"));
  print("\n");

  stdout.write("Memanggil opsional positional parameter =  \n");
  print(say2("Fauzi", "Sayang", "mauludy"));
  print("\n");

// atau tidak dipakai sama sekali juga tidak apa apa yang bagian optional parameter
  stdout.write("Memanggil opsional positional parameter =  \n");
  print(say2("Fauzi", "Sayang"));
  print("\n");

  //fungsi opsional default parameter
  print("==========================================");
  print("Fungsi opsional default named parameter");
  stdout.write("Memanggil opsional default named parameter =  \n");
  print(sayDefaultParameter("Fauzi", "Sayang", to: "mauludy"));
  print("\n");

  // meskipun parameter yang lain tidak dipakai juga tidak masalah.
  stdout.write("Memanggil opsional default parameter parameter =  \n");
  print(sayDefaultParameter("Fauzi", "Sayang", appName: " sms"));
  print("\n");

  stdout.write("Memanggil opsional default parameter parameter =  \n");
  print(sayDefaultParameter("Fauzi", "Sayang", to: "mauludy"));
  print("\n");

// atau tidak dipakai sama sekali juga tidak apa apa yang bagian optional parameter
// namun nilai default yang akan menggantikan
//meskipun parameter ke 4 tidak diisi , namun tetap akan muncul , karena ada default value nya
  stdout.write("Memanggil opsional default parameter parameter =  \n");
  print(sayDefaultParameter("Fauzi", "Sayang"));
  print("\n");

  print("==========================================");
  print("Fungsi sederhana dengan Arrow Syntax");

  luas = luasPersegiPanjang(p, l);
  stdout.write('Hasil Luas = ' + luas.toString());
  print('\n');

  // contoh fungsi dijadikan sebagai nilai variabel
  Function f;
  f = luasPersegiPanjang;
  print("==========================================");
  print("Fungsi sederhana dengan fungsi sebagia nilai vaariabel");
  luas = f(p, l);
  stdout.write('Hasil Luas = ' + luas.toString());
  print('\n');

  print("==========================================");
  print("Fungsi dengan Anonymous Function");
  print("Hasil luas = " +
      doMathOperator(p.toInt(), l.toInt(), (a, b) => a * b).toString());
  print('\n');

  print("==========================================");
  print("Fungsi dengan Anonymous Function");
  print("Hasil luas = " +
      doMathOperator2(p.toInt(), l.toInt(), (a, b) => a * b).toString());
  print('\n');
}
