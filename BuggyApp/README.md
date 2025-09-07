
## Eklenenler

* Globals sınıfı ekledim bu sayede userId'ye her yerden erişebiliyoruz ve test etmek için de kolaylık oldu

* Alert manager sınıfı ekledim basit alertleri gösterebilmek için 


## Düzeltilen hatalar
1. Model
* Modelde userId hatalı yazılmıştı codingKeys ekledim

2. Api Service
* todo ları userId'ye göre filtreledim ve o listeyi tableView'a gönderdim
* LastId ekledim bu id todoların idlerinin çakışmasının önüne geçmek için

3. ToDoList ViewController
* tableView delegate ve datasource eksikti bunları ekledim
* tableView.rowHeight = UITableView.automaticDimension ile dinamik yükseklik sağladım
* tableView cell constraintleri hatalıydı onları düzelttim
* todo ları en yeni todo üste gelicek şekilde sıraladım
* onToggle ile switch te bulunan eksikleri düzelttim
* detailVC.todo = todos[indexPath.section] burayı indexPath.row olarak değiştirdim
* tableView'e yana kaydırarak satırı silmek için özellik ekledim
* didFetchTodos içerisindeki kodu DispatchQueue içine aldım

4. ToDo cell
* onToggle ile switch in fonksiyonlarının çalışmasını sağladım
* hatalı bir if koşulu vardı onu kaldırdım
* text label 'a renk verdim ve numberofLines = 0 yaptım kaç satır olacağını kendisi ayarlasın diye

5. AddToDo ViewController
* save butonunun üstünde gizli View vardı butona tıklanmıyordu onu kaldırdım
* text boş ise göstermeyi alert ekledim
* todo id 'yi Globalsten alıyor 
* LastId ile en son id'nin +1 fazlasına yeni id ile todo oluşturuyor

6. Detail ViewController
* todo 'yu optional yaptım
* text label 'a renk verdim ve numberofLines = 0 yaptım kaç satır olacağını kendisi ayarlasın diye








  