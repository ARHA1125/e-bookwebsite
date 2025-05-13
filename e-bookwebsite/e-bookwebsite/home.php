<?php

@include 'config.php';

session_start();

$user_id = $_SESSION['user_id'];

if(!isset($user_id)){
   header('location:login.php');
}

if(isset($_POST['add_to_wishlist'])){

   $product_id = $_POST['product_id'];
   $product_name = $_POST['product_name'];
   $product_price = $_POST['product_price'];
   $product_image = $_POST['product_image'];
   
   $check_wishlist_numbers = mysqli_query($conn, "SELECT * FROM `wishlist` WHERE name = '$product_name' AND user_id = '$user_id'") or die('query failed');

   $check_cart_numbers = mysqli_query($conn, "SELECT * FROM `cart` WHERE name = '$product_name' AND user_id = '$user_id'") or die('query failed');

   if(mysqli_num_rows($check_wishlist_numbers) > 0){
       $message[] = 'telah ditambahkan ke wishlist';
   }elseif(mysqli_num_rows($check_cart_numbers) > 0){
       $message[] = 'telah ditambahkan ke keranjang';
   }else{
       mysqli_query($conn, "INSERT INTO `wishlist`(user_id, pid, name, price, image) VALUES('$user_id', '$product_id', '$product_name', '$product_price', '$product_image')") or die('query failed');
       $message[] = 'product ditambahkan ke wishlist';
   }

}

if(isset($_POST['add_to_cart'])){

   $product_id = $_POST['product_id'];
   $product_name = $_POST['product_name'];
   $product_price = $_POST['product_price'];
   $product_image = $_POST['product_image'];
   $product_quantity = $_POST['product_quantity'];

   $check_cart_numbers = mysqli_query($conn, "SELECT * FROM `cart` WHERE name = '$product_name' AND user_id = '$user_id'") or die('query failed');

   if(mysqli_num_rows($check_cart_numbers) > 0){
       $message[] = 'telah ditambahkan ke keranjang';
   }else{

       $check_wishlist_numbers = mysqli_query($conn, "SELECT * FROM `wishlist` WHERE name = '$product_name' AND user_id = '$user_id'") or die('query failed');

       if(mysqli_num_rows($check_wishlist_numbers) > 0){
           mysqli_query($conn, "DELETE FROM `wishlist` WHERE name = '$product_name' AND user_id = '$user_id'") or die('query failed');
       }

       mysqli_query($conn, "INSERT INTO `cart`(user_id, pid, name, price, quantity, image) VALUES('$user_id', '$product_id', '$product_name', '$product_price', '$product_quantity', '$product_image')") or die('query failed');
       $message[] = 'product ditambahkan ke keranjang!';
   }

}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>home</title>

   <!-- font cdn -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

   <!-- custom admin -->
   <link rel="stylesheet" href="css/style.css">

</head>
<body>
   
<?php @include 'header.php'; ?>

<div class="slider">
      <div class="myslider fade" style="display: block;">
         <div class="txt">
            <h1>E-BOOKS</h1>
            <p>FOR<br>ACADEMICS</p>
         </div>
         <img src="images/book-bg1.jpg" style="width: 100%; height: 100%;">
      </div>
      <div class="myslider fade">
         <div class="txt">
            <h1>E-BOOKS</h1>
            <p>FOREIGN<br>LANGUAGE</p>
         </div>
         <img src="images/book-bg2.jpg" style="width: 100%; height: 100%;">
      </div>
      <div class="myslider fade">
         <div class="txt">
            <h1>E-BOOKS</h1>
            <p>PROFESSIONAL<br>DEVELOPMENT</p>
         </div>
         <img src="images/book-bg5.jpg" style="width: 100%; height: 100%;">
      </div>
      <div class="myslider fade">
         <div class="txt">
            <h1>E-BOOKS</h1>
            <p>EXERCISE<br>AND TEXTBOOKS</p>
         </div>
         <img src="images/book-bg3.jpg" style="width: 100%; height: 100%;">
      </div>
      <div class="myslider fade">
         <div class="txt">
            <h1>E-BOOKS</h1>
            <p>FOR<br>STUDY GUIDES</p>
         </div>
         <img src="images/book-bg4.jpg" style="width: 100%; height: 100%;">
      </div>
      <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
      <a class="next" onclick="plusSlides(1)">&#10095;</a>

      <div class="dotsbox" style="text-align: center;">
      <span class="dot" onclick="currentSlide(1)"></span>
      <span class="dot" onclick="currentSlide(2)"></span>
      <span class="dot" onclick="currentSlide(3)"></span>
      <span class="dot" onclick="currentSlide(4)"></span>
      <span class="dot" onclick="currentSlide(5)"></span>
   </div>
</div>


<section class="products">

   <h1 class="title">buku untuk mahasiswa</h1>

   <div class="box-container">

      <?php
         $select_products = mysqli_query($conn, "SELECT * FROM `products` LIMIT 6") or die('query failed');
         if(mysqli_num_rows($select_products) > 0){
            while($fetch_products = mysqli_fetch_assoc($select_products)){
      ?>
      <form action="" method="POST" class="box">
         <a href="view_page.php?pid=<?php echo $fetch_products['id']; ?>" class="fas fa-eye"></a>
         <div class="price">Rp<?php echo $fetch_products['price']; ?>/-</div>
         <img src="uploaded_img/<?php echo $fetch_products['image']; ?>" alt="" class="image">
         <div class="name"><?php echo $fetch_products['name']; ?></div>
         <input type="number" name="product_quantity" value="1" min="0" class="qty">
         <input type="hidden" name="product_id" value="<?php echo $fetch_products['id']; ?>">
         <input type="hidden" name="product_name" value="<?php echo $fetch_products['name']; ?>">
         <input type="hidden" name="product_price" value="<?php echo $fetch_products['price']; ?>">
         <input type="hidden" name="product_image" value="<?php echo $fetch_products['image']; ?>">
         <input type="submit" value="tambahkan ke wishlist" name="add_to_wishlist" class="option-btn">
         <input type="submit" value="tambahkan ke cart" name="add_to_cart" class="btn">
      </form>
      <?php
         }
      }else{
         echo '<p class="empty">belum ada product yang ditambahkan!</p>';
      }
      ?>

   </div>

   <div class="more-btn">
      <a href="shop.php" class="option-btn">muat lebih banyak</a>
   </div>

</section>

<section class="home-contact">

   <div class="content">
      <h3>apakah ada pertanyaan?</h3>
      <p>"E-book ini, jendela ilmu yang terbuka lebar bagi para pencari makna."</p>
      <a href="contact.php" class="btn">contact kami</a>
   </div>

</section>




<?php @include 'footer.php'; ?>

<script src="js/script.js"></script>

</body>
</html>