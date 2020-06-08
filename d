  
using System;
using static System.Convert;
using System.Collections;
using System.Collections.Generic;

class Program
    {
        class Lib1
        {
            public class Student {
                public int id;
                public string fio;
                public int group;
                public string data;
            }
            public List<Student> s = new List<Student>();
            public void adds(int id, string fio, int group, string data){
                s.Add (new Student() {id = id, fio = fio, group = group, data = data }) ;
            }
            public void del (int id){
                for (int i = 0; i < s.Count; i++){
                    if (s[i].id == id) s.RemoveAt(i);
                }
            }
            public void izmen (int id, string fio, int group, string data) {
                for (int i = 0; i < s.Count; i++) {
                    if (s[i].id == id){
                        s[i].fio = fio;
                        s[i].group = group;
                        s[i].data = data;
                    }
                }
            }
            public void show(){
                foreach (var i in s){
                    Console.WriteLine (i.fio + "\n");
                }
            }
            public void poiskID(int id){
                Console.WriteLine(s[id].id + "\n" + s[id].fio + "\n" + s[id].group + "\n" + s[id].data + "\n");                
            }
            public void age(int idi){
                DateTime idage = ToDateTime(s[idi].data);
                DateTime now = DateTime.Today;
                int age = now.Year - idage.Year;
                if (idage > now.AddYears(-age)) age--;
                Console.WriteLine(age + " - возраст студента.");
            } 
        }
        static void Main(string[] args){
            Lib1 Lib2 = new Lib1();
            int id = 0;
            int a;
            do {
                Console.WriteLine("\nВведите: \n 1. Чтобы добавить студента \n 2. Чтобы изменить \n 3. Удалить \n 4. Вывести ФИО \n " +
                    "5. ID \n 6. Возраст выбранного по ID студента\n");
                a = ToInt32(Console.ReadLine());
                Console.WriteLine("\n");
                if (a == 1){
                    Console.WriteLine("\nФИО: ");
                    string fio = Console.ReadLine();
                    Console.WriteLine("Группа: ");
                    int group = ToInt32(Console.ReadLine());
                    Console.WriteLine("Дата рождения дд.мм.гггг: ");
                    string data = Console.ReadLine();
                    Lib2.adds(id, fio, group, data);
                    id++;
                }
                else if (a == 2) {
                    Console.WriteLine("\nID: ");
                    int idsT = ToInt32(Console.ReadLine());
                    Console.WriteLine("ФИО: ");
                    string fio = Console.ReadLine();
                    Console.WriteLine("Введите группу: ");
                    int group = ToInt32(Console.ReadLine());
                    Console.WriteLine("Введите дату рождения дд.мм.гггг: ");
                    string data = Console.ReadLine();
                    Lib2.izmen(idsT, fio, group, data);
                }
                else if (a == 3) {
                    id = ToInt32(Console.ReadLine());
                    Lib2.del(id);
                } 
                else if (a == 4) Lib2.show();
                else if (a == 5) {
                    Console.WriteLine("Введите ID:");
                    int id1 = ToInt32(Console.ReadLine());
                    Lib2.poiskID(id1);
                }
                else if (a == 6) {
                    Console.WriteLine("Введите ID:");
                    int IDage = ToInt32(Console.ReadLine());
                    Lib2.age(IDage);
                }
                
            } while (a != 0) ;
        }
    }
