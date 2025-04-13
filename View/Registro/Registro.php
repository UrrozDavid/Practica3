<?php

include_once $_SERVER['DOCUMENT_ROOT'] . "/Practica3/View/layout.php";
include_once $_SERVER["DOCUMENT_ROOT"] . "/Practica3/Controller/RegistroController.php";

?>

<!DOCTYPE html>

<html lang="en">

<?php PrintCss(); ?>


<body data-spy="scroll" data-target="#navbarNav" data-offset="50">

     <?php PrintMenu(); ?>

     <section class="principal d-flex flex-column justify-content-center align-items-center" id="home">

          <div class="bg-overlay"></div>

          <div class="container">
               <div class="row">

                    <div class="col-lg-8 col-md-10 mx-auto col-12">
                         <div class="hero-text mt-5 text-center">


                              <h1 class="text-white" data-aos="fade-up" data-aos-delay="500">Bienvenido Al Almacen
                                   DAJAVA!</h1>

                              <div class="text-center">
                                   <h1 class="h4 text-gray-900 mb-4">Crear Abono</h1>
                              </div>

                              <?php
                              if (isset($_POST["Message"])) {
                                   echo '<div class="alert alert-warning Mensajes">' . $_POST["Message"] . '</div>';
                              }
                              ?>

                              <form action="" method="POST" enctype="multipart/form-data">
                                   <div class="form-group">
                                        <select class="form-control" id="Id_Compra" name="Id_Compra" required>
                                             <?php
                                             
                                             //Ahi lo del compañero consulta (metodo consulta)

                                             echo "<option value=''>Seleccione</option>";
                                             while ($row = mysqli_fetch_array($datos)) {
                                                  echo "<option value=" . $row["Id_Compra"] . ">" . $row["Descripcion"] . "</option>";
                                             }


                                             ?>

                                        </select>
                                   </div>

                                   <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Saldo Anterior" id="txtMonto"
                                             name="txtMonto" maxlength="11" required>
                                   </div>

                                   <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Abono" id="txtMonto"
                                             name="txtMonto" maxlength="255" required>
                                   </div>


                                   <input type="submit" class="btn btn-danger" style="width: 200px;" value="Procesar"
                                        id="btnCrearOferta" name="btnCrearOferta">
                              </form>

                         </div>
                    </div>

               </div>
          </div>
     </section>

     <?php PrintFooter(); ?>

     <?php PrintScript(); ?>

</body>

</html>