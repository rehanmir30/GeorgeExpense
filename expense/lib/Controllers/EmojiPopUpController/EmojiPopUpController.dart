
import 'package:get/get.dart';

import '../../Models/category.dart';

class EmojiPopUpController extends GetxController{


  // Define your custom emojis here
  List<String>? AnimalEmoji=[
    "assets/images/AnimalIcon/abeja.png",
    "assets/images/AnimalIcon/alimentos-para-mascotas.png",
    "assets/images/AnimalIcon/arana.png",
    "assets/images/AnimalIcon/aseo.png",
    "assets/images/AnimalIcon/caja-del-gato.png",
    "assets/images/AnimalIcon/cama-para-mascotas.png",
    "assets/images/AnimalIcon/canario.png",
    "assets/images/AnimalIcon/cerdo.png",
    "assets/images/AnimalIcon/collar-de-perro.png",
    "assets/images/AnimalIcon/comida-de-gato.png",
    "assets/images/AnimalIcon/conejo.png",
    "assets/images/AnimalIcon/entrenador.png",
    "assets/images/AnimalIcon/feliz.png",
    "assets/images/AnimalIcon/gallina.png",
    "assets/images/AnimalIcon/gato.png",
    "assets/images/AnimalIcon/gato-negro.png",
    "assets/images/AnimalIcon/hamster.png",
    "assets/images/AnimalIcon/huella.png",
    "assets/images/AnimalIcon/hueso.png",
    "assets/images/AnimalIcon/jaula-para-mascotas.png",
    "assets/images/AnimalIcon/jeringuilla.png",
    "assets/images/AnimalIcon/juguetes.png",
    "assets/images/AnimalIcon/leon.png",
    "assets/images/AnimalIcon/panda.png",
    "assets/images/AnimalIcon/pato.png",
    "assets/images/AnimalIcon/pato (1).png",
    "assets/images/AnimalIcon/pelo-corto-exotico.png",
    "assets/images/AnimalIcon/perro.png",
    "assets/images/AnimalIcon/perro (1).png",
    "assets/images/AnimalIcon/perro (2).png",
    "assets/images/AnimalIcon/perro (3).png",
    "assets/images/AnimalIcon/pez-payaso.png",
    "assets/images/AnimalIcon/pinguino.png",
    "assets/images/AnimalIcon/plato-de-perro.png",
    "assets/images/AnimalIcon/ropa.png",
    "assets/images/AnimalIcon/seguro-de-mascota.png",
    "assets/images/AnimalIcon/tortuga.png",
     "assets/images/AnimalIcon/vaca.png",
    "assets/images/AnimalIcon/veterinario.png",
    "assets/images/AnimalIcon/veterinario (1).png"
  ];
  List<String>? BabyEmoji=[
    "assets/images/BabyIcon/abuelo.png",
    "assets/images/BabyIcon/anciana.png",
    "assets/images/BabyIcon/bebe.png",
    "assets/images/BabyIcon/bebe (1).png",
    "assets/images/BabyIcon/biberon.png",
    "assets/images/BabyIcon/bloques.png",
    "assets/images/BabyIcon/carretilla.png",
    "assets/images/BabyIcon/chupete.png",
    "assets/images/BabyIcon/comida-para-bebe.png",
    "assets/images/BabyIcon/crema-facial.png",
    "assets/images/BabyIcon/cuento.png",
    "assets/images/BabyIcon/cuna.png",
    "assets/images/BabyIcon/formula.png",
    "assets/images/BabyIcon/juguetes.png",
    "assets/images/BabyIcon/mama.png",
    "assets/images/BabyIcon/muneca.png",
    "assets/images/BabyIcon/panal.png",
    "assets/images/BabyIcon/papa.png",
    "assets/images/BabyIcon/silla-de-bebe.png",
    "assets/images/BabyIcon/talco-para-bebes.png",
    "assets/images/BabyIcon/termometro.png",
    "assets/images/BabyIcon/toallita-mojada.png"
  ];
  List<String>? BusinessEmoji=[

    "assets/images/BusinessIcon/alquilar.png",
    "assets/images/BusinessIcon/altoparlante.png",
    "assets/images/BusinessIcon/base-de-datos-en-la-nube.png",
    "assets/images/BusinessIcon/big-data.png",
    "assets/images/BusinessIcon/clave.png",
    "assets/images/BusinessIcon/clip-de-papel.png",
    "assets/images/BusinessIcon/dinero.png",
    "assets/images/BusinessIcon/diseno-grafico.png",
    "assets/images/BusinessIcon/edificio.png",
    "assets/images/BusinessIcon/edificio-de-oficinas.png",
    "assets/images/BusinessIcon/graduado.png",
    "assets/images/BusinessIcon/grafico.png",
    "assets/images/BusinessIcon/grafico (1).png",
    "assets/images/BusinessIcon/libro.png",
    "assets/images/BusinessIcon/libro-abierto.png",
    "assets/images/BusinessIcon/maletin.png",
    "assets/images/BusinessIcon/ordenador.png",
    "assets/images/BusinessIcon/permiso.png",
    "assets/images/BusinessIcon/pizarra.png",
    "assets/images/BusinessIcon/pizarra-blanca.png",
    "assets/images/BusinessIcon/servicios-de-consultoria.png",
    "assets/images/BusinessIcon/servicios-de-consultoria (1).png",
    "assets/images/BusinessIcon/servicios-de-consultoria (2).png",
    "assets/images/BusinessIcon/silla-giratoria.png",
    "assets/images/BusinessIcon/suministro.png",
    "assets/images/BusinessIcon/viajar.png",
    "assets/images/BusinessIcon/visa.png"
  ];
  List<String>? CarEmoji=[
    "assets/images/CarIcon/car.png"
  ];
  List<String>? EntertainmentEmoji=[
    "assets/images/EntertainmentIcon/autobus.png",
    "assets/images/EntertainmentIcon/bailando.png",
    "assets/images/EntertainmentIcon/bicicleta-de-montana.png",
    "assets/images/EntertainmentIcon/bolsa-de-la-compra.png",
    "assets/images/EntertainmentIcon/botiquin-medico.png",
    "assets/images/EntertainmentIcon/cama-de-hotel.png",
    "assets/images/EntertainmentIcon/camara-reflex-digital.png",
    "assets/images/EntertainmentIcon/camping.png",
    "assets/images/EntertainmentIcon/cinco-de-mayo.png",
    "assets/images/EntertainmentIcon/cocina.png",
    "assets/images/EntertainmentIcon/cuchillo.png",
    "assets/images/EntertainmentIcon/de-viaje.png",
    "assets/images/EntertainmentIcon/embarque.png",
    "assets/images/EntertainmentIcon/entertainment.png",
    "assets/images/EntertainmentIcon/entradas-de-cine.png",
    "assets/images/EntertainmentIcon/hotel.png",
    "assets/images/EntertainmentIcon/mansion.png",
    "assets/images/EntertainmentIcon/mapa.png",
    "assets/images/EntertainmentIcon/montana-rusa.png",
    "assets/images/EntertainmentIcon/parque-de-atracciones.png",
    "assets/images/EntertainmentIcon/proteccion.png",
    "assets/images/EntertainmentIcon/restaurante.png",
    "assets/images/EntertainmentIcon/seguridad-informatica.png",
    "assets/images/EntertainmentIcon/tarjeta-de-embarque.png",
    "assets/images/EntertainmentIcon/tejido-de-punto.png",
    "assets/images/EntertainmentIcon/tenedor.png",
    "assets/images/EntertainmentIcon/tren.png",
    "assets/images/EntertainmentIcon/tren-electrico.png",
    "assets/images/EntertainmentIcon/tubo-respirador.png",
    "assets/images/EntertainmentIcon/vacaciones.png"
  ];
  List<String>? FamilyEmoji=[
    "assets/images/FamilyIcon/abuela.png",
    "assets/images/FamilyIcon/abuelo.png",
    "assets/images/FamilyIcon/bebe.png",
    "assets/images/FamilyIcon/bebe (1).png",
    "assets/images/FamilyIcon/cara-feliz.png",
    "assets/images/FamilyIcon/chico.png",
    "assets/images/FamilyIcon/chico (1).png",
    "assets/images/FamilyIcon/chico (2).png",
    "assets/images/FamilyIcon/familia.png",
    "assets/images/FamilyIcon/familia (1).png",
    "assets/images/FamilyIcon/familia (2).png",
    "assets/images/FamilyIcon/gatear.png",
    "assets/images/FamilyIcon/hembra.png",
    "assets/images/FamilyIcon/hermana.png",
    "assets/images/FamilyIcon/hermanos.png",
    "assets/images/FamilyIcon/hijo.png",
    "assets/images/FamilyIcon/hombre.png",
    "assets/images/FamilyIcon/love-and-romance.png",
    "assets/images/FamilyIcon/madre.png",
    "assets/images/FamilyIcon/madre (1).png",
    "assets/images/FamilyIcon/media-hermana.png",
    "assets/images/FamilyIcon/medio-hermano.png",
    "assets/images/FamilyIcon/nino (1).png",
    "assets/images/FamilyIcon/padre.png",
    "assets/images/FamilyIcon/papa.png",
    "assets/images/FamilyIcon/recreo.png",
    "assets/images/FamilyIcon/suegra.png",
    "assets/images/FamilyIcon/tia.png",
    "assets/images/FamilyIcon/tio.png",
  ];
  List<String>? FinanceEmoji=[
    "assets/images/FinanceIcon/01.png",
    "assets/images/FinanceIcon/ahorro.png",
    "assets/images/FinanceIcon/ahorro d.png",
    "assets/images/FinanceIcon/ahorro-de-dinero.png",
    "assets/images/FinanceIcon/aplicacion-wallet-pass (1).png",
    "assets/images/FinanceIcon/aplicacion-wallet-pass (2).png",
    "assets/images/FinanceIcon/aplicacion-wallet-pass (3).png",
    "assets/images/FinanceIcon/aplicacion-wallet-pass (4).png",
    "assets/images/FinanceIcon/bancario.png",
    "assets/images/FinanceIcon/banco.png",
    "assets/images/FinanceIcon/banco (2).png",
    "assets/images/FinanceIcon/banco (3).png",
    "assets/images/FinanceIcon/barra-grafica.png",
    "assets/images/FinanceIcon/billetera.png",
    "assets/images/FinanceIcon/billetera (1).png",
    "assets/images/FinanceIcon/billetera 454.png",
    "assets/images/FinanceIcon/bolsa-de-dinero (1).png",
    "assets/images/FinanceIcon/bolsa-de-dinero (3).png",
    "assets/images/FinanceIcon/bote-de-dinero.png",
    "assets/images/FinanceIcon/calculadora.png",
    "assets/images/FinanceIcon/calcular.png",
    "assets/images/FinanceIcon/dinero.png",
    "assets/images/FinanceIcon/dinero (2).png",
    "assets/images/FinanceIcon/dinero (5).png",
    "assets/images/FinanceIcon/dinero (6).png",
    "assets/images/FinanceIcon/dinero (7).png",
    "assets/images/FinanceIcon/dinero (8).png",
    "assets/images/FinanceIcon/dinero (9).png",
    "assets/images/FinanceIcon/dinero (11).png",
    "assets/images/FinanceIcon/dinero (12).png",
    "assets/images/FinanceIcon/dolar (1).png",
    "assets/images/FinanceIcon/dolar (3).png",
    "assets/images/FinanceIcon/dolar (5).png",
    "assets/images/FinanceIcon/dolar (6).png",
    "assets/images/FinanceIcon/estadistica (1).png",
    "assets/images/FinanceIcon/estadistica (3).png",
    "assets/images/FinanceIcon/estadistica (4).png",
    "assets/images/FinanceIcon/estadistica (5).png",
    "assets/images/FinanceIcon/euro.png",
    "assets/images/FinanceIcon/euro (1).png",
    "assets/images/FinanceIcon/euro (2).png",
    "assets/images/FinanceIcon/lista.png",
    "assets/images/FinanceIcon/lista-de-verificacion.png",
    "assets/images/FinanceIcon/lista-de-verificacion (2).png",
    "assets/images/FinanceIcon/matematicas.png",
    "assets/images/FinanceIcon/moneda (1).png",
    "assets/images/FinanceIcon/MONEY FLUJO.png",
    "assets/images/FinanceIcon/money-management.png",
    "assets/images/FinanceIcon/money-management (4).png",
    "assets/images/FinanceIcon/pagar.png",
    "assets/images/FinanceIcon/prestamo.png",
    "assets/images/FinanceIcon/salario.png",
    "assets/images/FinanceIcon/tarje.png",
    "assets/images/FinanceIcon/tarjeta.png",
    "assets/images/FinanceIcon/tarjeta (1).png",
    "assets/images/FinanceIcon/tarjeta de credito (1).png",
    "assets/images/FinanceIcon/tarjeta de credito (2).png",
    "assets/images/FinanceIcon/tarjeta de credito (3).png",
    "assets/images/FinanceIcon/tarjeta de credito (4).png",
    "assets/images/FinanceIcon/tarjeta de credito (5).png",
    "assets/images/FinanceIcon/tarjeta de credito (6).png",
    "assets/images/FinanceIcon/tarjeta de credito (7).png",
    "assets/images/FinanceIcon/tarjeta de credito (8).png",
    "assets/images/FinanceIcon/tarjeta de credito (9).png",
    "assets/images/FinanceIcon/tarjeta de credito (10).png",
    "assets/images/FinanceIcon/tarjeta dk.png",
    "assets/images/FinanceIcon/visa.png",
    "assets/images/FinanceIcon/visa (1).png",
    "assets/images/FinanceIcon/visa (2).png",
    "assets/images/FinanceIcon/yuan.png",
    "assets/images/FinanceIcon/yuan (1).png",
    "assets/images/FinanceIcon/yuan (2).png",
    "assets/images/FinanceIcon/Z.png"
  ];
  List<String>? FoodAndDrinksEmoji=[
    "assets/images/FoodAndDrinksIcon/agua.png",
    "assets/images/FoodAndDrinksIcon/arroz.png",
    "assets/images/FoodAndDrinksIcon/barbacoa.png",
    "assets/images/FoodAndDrinksIcon/camarera.png",
    "assets/images/FoodAndDrinksIcon/camaron.png",
    "assets/images/FoodAndDrinksIcon/cerveza.png",
    "assets/images/FoodAndDrinksIcon/cocina.png",
    "assets/images/FoodAndDrinksIcon/coctel.png",
    "assets/images/FoodAndDrinksIcon/coctel (1).png",
    "assets/images/FoodAndDrinksIcon/copas-de-vino.png",
    "assets/images/FoodAndDrinksIcon/cuchara-y-tenedor.png",
    "assets/images/FoodAndDrinksIcon/cuchillo.png",
    "assets/images/FoodAndDrinksIcon/ensalada-de-frutas.png",
    "assets/images/FoodAndDrinksIcon/galleta.png",
    "assets/images/FoodAndDrinksIcon/hamburguesa.png",
    "assets/images/FoodAndDrinksIcon/helado.png",
    "assets/images/FoodAndDrinksIcon/huevos.png",
    "assets/images/FoodAndDrinksIcon/leche.png",
    "assets/images/FoodAndDrinksIcon/magdalena.png",
    "assets/images/FoodAndDrinksIcon/malteada.png",
    "assets/images/FoodAndDrinksIcon/manzana.png",
    "assets/images/FoodAndDrinksIcon/olla.png",
    "assets/images/FoodAndDrinksIcon/pancho.png",
    "assets/images/FoodAndDrinksIcon/pez-muerto.png",
    "assets/images/FoodAndDrinksIcon/pierna-de-pollo.png",
    "assets/images/FoodAndDrinksIcon/pizza.png",
    "assets/images/FoodAndDrinksIcon/pollo.png",
    "assets/images/FoodAndDrinksIcon/queso.png",
    "assets/images/FoodAndDrinksIcon/taco.png",
    "assets/images/FoodAndDrinksIcon/taza-de-cafe.png",
    "assets/images/FoodAndDrinksIcon/te-verde.png",
    "assets/images/FoodAndDrinksIcon/un-pan.png",
    "assets/images/FoodAndDrinksIcon/zanahoria.png"
  ];
  List<String>? GymEmoji=[
    "assets/images/GymIcon/aerobic.png",
    "assets/images/GymIcon/aerobicos.png",
    "assets/images/GymIcon/aptitud-fisica.png",
    "assets/images/GymIcon/artes-marciales.png",
    "assets/images/GymIcon/deporte.png",
    "assets/images/GymIcon/dieta.png",
    "assets/images/GymIcon/ejercicio.png",
    "assets/images/GymIcon/entrenador-personal.png",
    "assets/images/GymIcon/entrenador-personal (1).png",
    "assets/images/GymIcon/fresa.png",
    "assets/images/GymIcon/gimnasio.png",
    "assets/images/GymIcon/kickboxing.png",
    "assets/images/GymIcon/levantador-de-pesas.png",
    "assets/images/GymIcon/levantamiento-de-pesas.png",
    "assets/images/GymIcon/levantamiento-de-pesas (1).png",
    "assets/images/GymIcon/medicamento.png",
    "assets/images/GymIcon/mujer.png",
    "assets/images/GymIcon/nadador.png",
    "assets/images/GymIcon/natacion.png",
    "assets/images/GymIcon/proteina.png",
    "assets/images/GymIcon/proteina-en-polvo.png",
    "assets/images/GymIcon/ropa-de-deporte.png",
    "assets/images/GymIcon/ropa-de-mujer.png",
    "assets/images/GymIcon/sauna.png",
    "assets/images/GymIcon/tarjeta-de-membresia.png",
    "assets/images/GymIcon/zapatillas.png",
    "assets/images/GymIcon/zumba.png"
  ];
  List<String>? HealthCareEmoji=[
    "assets/images/HealthCareIcon/avatar.png",
    "assets/images/HealthCareIcon/cama.png",
    "assets/images/HealthCareIcon/cepillo-de-dientes.png",
    "assets/images/HealthCareIcon/cerebro.png",
    "assets/images/HealthCareIcon/dentista.png",
    "assets/images/HealthCareIcon/diente.png",
    "assets/images/HealthCareIcon/doctor.png",
    "assets/images/HealthCareIcon/estetoscopio.png",
    "assets/images/HealthCareIcon/frasco.png",
    "assets/images/HealthCareIcon/frasco-de-pastillas.png",
    "assets/images/HealthCareIcon/gafas-de-sol.png",
    "assets/images/HealthCareIcon/hospital.png",
    "assets/images/HealthCareIcon/jeringa.png",
    "assets/images/HealthCareIcon/masaje.png",
    "assets/images/HealthCareIcon/medicamento.png",
    "assets/images/HealthCareIcon/medicamento (1).png",
    "assets/images/HealthCareIcon/meditacion.png",
    "assets/images/HealthCareIcon/microscopio.png",
    "assets/images/HealthCareIcon/muestra.png",
    "assets/images/HealthCareIcon/ojo.png",
    "assets/images/HealthCareIcon/pastillas.png",
    "assets/images/HealthCareIcon/rayos-x.png",
    "assets/images/HealthCareIcon/silla-de-ruedas.png",
    "assets/images/HealthCareIcon/social.png",
    "assets/images/HealthCareIcon/sonrisa.png",
    "assets/images/HealthCareIcon/soportes.png",
    "assets/images/HealthCareIcon/soportes (1).png",
    "assets/images/HealthCareIcon/tirantes.png"
  ];
  List<String>? HomeEmoji=[
    "assets/images/HomeIcon/alicate.png",
    "assets/images/HomeIcon/banos.png",
    "assets/images/HomeIcon/bebe.png",
    "assets/images/HomeIcon/brocha.png",
    "assets/images/HomeIcon/cable-de-energia.png",
    "assets/images/HomeIcon/cajon.png",
    "assets/images/HomeIcon/cama.png",
    "assets/images/HomeIcon/cigarrillo.png",
    "assets/images/HomeIcon/cinta-metrica.png",
    "assets/images/HomeIcon/contenedor-de-basura.png",
    "assets/images/HomeIcon/cubo-de-pintura.png",
    "assets/images/HomeIcon/ducha.png",
    "assets/images/HomeIcon/gancho-de-ropa.png",
    "assets/images/HomeIcon/garaje.png",
    "assets/images/HomeIcon/grifo.png",
    "assets/images/HomeIcon/herramientas-para-reparar.png",
    "assets/images/HomeIcon/herramientas-y-utensilios.png",
    "assets/images/HomeIcon/home.png",
    "assets/images/HomeIcon/home2.png",
    "assets/images/HomeIcon/horno.png",
    "assets/images/HomeIcon/inodoro.png",
    "assets/images/HomeIcon/maletin.png",
    "assets/images/HomeIcon/mesa-circular.png",
    "assets/images/HomeIcon/mezclador.png",
    "assets/images/HomeIcon/microonda.png",
    "assets/images/HomeIcon/modista.png",
    "assets/images/HomeIcon/nevera.png",
    "assets/images/HomeIcon/pala.png",
    "assets/images/HomeIcon/paraguas.png",
    "assets/images/HomeIcon/paraguas (1).png",
    "assets/images/HomeIcon/perforar.png",
    "assets/images/HomeIcon/planchado.png",
    "assets/images/HomeIcon/radio.png",
    "assets/images/HomeIcon/rodillos-de-pintura.png",
    "assets/images/HomeIcon/sierra-electrica.png",
    "assets/images/HomeIcon/sillon.png",
    "assets/images/HomeIcon/sube-las-escaleras.png",
    "assets/images/HomeIcon/telefono-fijo.png",
    "assets/images/HomeIcon/televisor.png",
    "assets/images/HomeIcon/televisor (1).png",
    "assets/images/HomeIcon/tijeras.png",
    "assets/images/HomeIcon/tina-de-bano.png",
    "assets/images/HomeIcon/ventilador.png"
  ];
  List<String>? ITComputerIEmoji=[
    "assets/images/ITComputerIcons/auriculares.png",
    "assets/images/ITComputerIcons/auriculares-con-microfono.png",
    "assets/images/ITComputerIcons/caja-de-cd.png",
    "assets/images/ITComputerIcons/chat.png",
    "assets/images/ITComputerIcons/desarrollo-de-software.png",
    "assets/images/ITComputerIcons/disco-duro.png",
    "assets/images/ITComputerIcons/disco-duro (1).png",
    "assets/images/ITComputerIcons/discos-compactos.png",
    "assets/images/ITComputerIcons/forma-de-microfono-negrom.png",
    "assets/images/ITComputerIcons/impresion.png",
    "assets/images/ITComputerIcons/impresora.png",
    "assets/images/ITComputerIcons/lan.png",
    "assets/images/ITComputerIcons/memoria-ram.png",
    "assets/images/ITComputerIcons/modem.png",
    "assets/images/ITComputerIcons/modem (1).png",
    "assets/images/ITComputerIcons/ordenador.png",
    "assets/images/ITComputerIcons/ordenador-portatil.png",
    "assets/images/ITComputerIcons/pantalla-de-portatil.png",
    "assets/images/ITComputerIcons/qr-scan.png",
    "assets/images/ITComputerIcons/raton.png",
    "assets/images/ITComputerIcons/simbolo-de-windows.png",
    "assets/images/ITComputerIcons/tableta.png",
    "assets/images/ITComputerIcons/tarjeta-de-video.png",
    "assets/images/ITComputerIcons/tarjeta-principal.png",
    "assets/images/ITComputerIcons/teclado.png",
    "assets/images/ITComputerIcons/teclado-y-raton.png"
  ];
  List<String>? MakupEmoji=[
    "assets/images/MakeupIcon/arte_de_unas.png",
    "assets/images/MakeupIcon/belleza.png",
    "assets/images/MakeupIcon/broche_del_pelo.png",
    "assets/images/MakeupIcon/cepillo_para_tinte-de_cabello.png",
    "assets/images/MakeupIcon/cortar_con_tijeras.png",
    "assets/images/MakeupIcon/corte_de_pelo.png",
    "assets/images/MakeupIcon/corte-de-pelo (1).png",
    "assets/images/MakeupIcon/depilacion.png",
    "assets/images/MakeupIcon/esmalte_de_unas.png",
    "assets/images/MakeupIcon/herramienta_de_corte_de_pelo.png",
    "assets/images/MakeupIcon/locion.png",
    "assets/images/MakeupIcon/manicura.png",
    "assets/images/MakeupIcon/maquillaje.png",
    "assets/images/MakeupIcon/maquillaje.png",
    "assets/images/MakeupIcon/masaje.png",
    "assets/images/MakeupIcon/mascara_de_cabello.png",
    "assets/images/MakeupIcon/mascara-facial.png",
    "assets/images/MakeupIcon/mujer.png",
    "assets/images/MakeupIcon/pedicura.png",
    "assets/images/MakeupIcon/pedicure.png",
    "assets/images/MakeupIcon/peinado.png",
    "assets/images/MakeupIcon/peinado1.png",
    "assets/images/MakeupIcon/perforacion.png",
    "assets/images/MakeupIcon/perforacion1.png",
    "assets/images/MakeupIcon/proteccion_de_la_piel.png",
    "assets/images/MakeupIcon/relajarse.png",
    "assets/images/MakeupIcon/tratamiento_capilar.png"
  ];
  List<String>? RestaurantEmoji=[
    "assets/images/RestaurantIcon/restaurant.png"
  ];
  List<String>? RopaClothingEmoji=[
    "assets/images/RopaClothingIcon/abrigo.png",
    "assets/images/RopaClothingIcon/abrigo-acolchado.png",
    "assets/images/RopaClothingIcon/bikini.png",
    "assets/images/RopaClothingIcon/blusa.png",
    "assets/images/RopaClothingIcon/bragas.png",
    "assets/images/RopaClothingIcon/bufanda.png",
    "assets/images/RopaClothingIcon/bufanda (1).png",
    "assets/images/RopaClothingIcon/calzoncillos.png",
    "assets/images/RopaClothingIcon/camisa.png",
    "assets/images/RopaClothingIcon/camisa (1).png",
    "assets/images/RopaClothingIcon/camisa (2).png",
    "assets/images/RopaClothingIcon/camisa (3).png",
    "assets/images/RopaClothingIcon/camisa-hawaiana.png",
    "assets/images/RopaClothingIcon/camisa-polo.png",
    "assets/images/RopaClothingIcon/camiseta.png",
    "assets/images/RopaClothingIcon/camiseta (1).png",
    "assets/images/RopaClothingIcon/camiseta (2).png",
    "assets/images/RopaClothingIcon/camiseta (3).png",
    "assets/images/RopaClothingIcon/cinturon.png",
    "assets/images/RopaClothingIcon/cinturon (1).png",
    "assets/images/RopaClothingIcon/cinturon (2).png",
    "assets/images/RopaClothingIcon/corto.png",
    "assets/images/RopaClothingIcon/deporte.png",
    "assets/images/RopaClothingIcon/falda.png",
    "assets/images/RopaClothingIcon/falda (1).png",
    "assets/images/RopaClothingIcon/gafas-de-sol.png",
    "assets/images/RopaClothingIcon/gafas-de-sol (1).png",
    "assets/images/RopaClothingIcon/gafas-de-sol (2).png",
    "assets/images/RopaClothingIcon/gorra.png",
    "assets/images/RopaClothingIcon/gorra (1).png",
    "assets/images/RopaClothingIcon/gorra-de-beisbol.png",
    "assets/images/RopaClothingIcon/mascara-para-los-ojos.png",
    "assets/images/RopaClothingIcon/pantalon.png",
    "assets/images/RopaClothingIcon/pantalones.png",
    "assets/images/RopaClothingIcon/pantalones (1).png",
    "assets/images/RopaClothingIcon/pantalones (2).png",
    "assets/images/RopaClothingIcon/pantalones (3).png",
    "assets/images/RopaClothingIcon/pijama.png",
    "assets/images/RopaClothingIcon/ropa.png",
    "assets/images/RopaClothingIcon/ropa-deportiva.png",
    "assets/images/RopaClothingIcon/ropa-interior.png",
    "assets/images/RopaClothingIcon/sombrero-de-vaquero.png",
    "assets/images/RopaClothingIcon/sosten.png",
    "assets/images/RopaClothingIcon/tacones-altos.png",
    "assets/images/RopaClothingIcon/top-corto.png",
    "assets/images/RopaClothingIcon/traje.png",
    "assets/images/RopaClothingIcon/traje (1).png",
    "assets/images/RopaClothingIcon/traje (2).png",
    "assets/images/RopaClothingIcon/traje-de-bano.png",
    "assets/images/RopaClothingIcon/traje-de-boda.png",
    "assets/images/RopaClothingIcon/trajes-de-bano.png",
    "assets/images/RopaClothingIcon/vestido.png",
    "assets/images/RopaClothingIcon/vestir.png",
    "assets/images/RopaClothingIcon/zapato.png",
    "assets/images/RopaClothingIcon/zapatos.png",
    "assets/images/RopaClothingIcon/zapatos (1).png",
    "assets/images/RopaClothingIcon/zapatos (2).png",
    "assets/images/RopaClothingIcon/zapatos (3).png"
  ];
  List<String>? ServicesEmoji=[
    "assets/images/ServicesIcon/ahorrar-agua.png",
    "assets/images/ServicesIcon/antena-parabolica.png",
    "assets/images/ServicesIcon/bombilla (1).png",
    "assets/images/ServicesIcon/camion-de-la-basura.png",
    "assets/images/ServicesIcon/compartimiento.png",
    "assets/images/ServicesIcon/gas-natural.png",
    "assets/images/ServicesIcon/glp.png",
    "assets/images/ServicesIcon/gota-de-agua.png",
    "assets/images/ServicesIcon/grifo-de-agua.png",
    "assets/images/ServicesIcon/impuestos.png",
    "assets/images/ServicesIcon/impuestos (1).png",
    "assets/images/ServicesIcon/internet.png",
    "assets/images/ServicesIcon/iphone.png",
    "assets/images/ServicesIcon/papelera-de-reciclaje.png",
    "assets/images/ServicesIcon/relampago.png",
    "assets/images/ServicesIcon/router-inalambrico.png",
    "assets/images/ServicesIcon/services.png",
    "assets/images/ServicesIcon/telefono-fijo.png",
    "assets/images/ServicesIcon/telefono-inteligente.png",
    "assets/images/ServicesIcon/televisor.png",
    "assets/images/ServicesIcon/valvula.png",
    "assets/images/ServicesIcon/viendo-la-television.png",
    "assets/images/ServicesIcon/wifi.png"
  ];
  List<String>? ShoppingEmoji=[
    "assets/images/ShoppingIcon/bar.png",
    "assets/images/ShoppingIcon/cafe.png",
    "assets/images/ShoppingIcon/cafeteria.png",
    "assets/images/ShoppingIcon/camarero.png",
    "assets/images/ShoppingIcon/carne.png",
    "assets/images/ShoppingIcon/carniceria.png",
    "assets/images/ShoppingIcon/carrito-de-compras.png",
    "assets/images/ShoppingIcon/carrito-de-supermercado.png",
    "assets/images/ShoppingIcon/carro (1).png",
    "assets/images/ShoppingIcon/cesta-de-la-compra.png",
    "assets/images/ShoppingIcon/cocina.png",
    "assets/images/ShoppingIcon/cocteles.png",
    "assets/images/ShoppingIcon/comida.png",
    "assets/images/ShoppingIcon/comida-a-domicilio.png",
    "assets/images/ShoppingIcon/cuerno.png",
    "assets/images/ShoppingIcon/dulces.png",
    "assets/images/ShoppingIcon/fruta.png",
    "assets/images/ShoppingIcon/hamburguesa.png",
    "assets/images/ShoppingIcon/hamburguesa-con-queso.png",
    "assets/images/ShoppingIcon/no-comida-rapida.png",
    "assets/images/ShoppingIcon/pan-de-molde.png",
    "assets/images/ShoppingIcon/pan-de-molde (1).png",
    "assets/images/ShoppingIcon/pastel.png",
    "assets/images/ShoppingIcon/pez.png",
    "assets/images/ShoppingIcon/postre.png",
    "assets/images/ShoppingIcon/productos-lacteos.png",
    "assets/images/ShoppingIcon/pub.png",
    "assets/images/ShoppingIcon/supermercado.png",
    "assets/images/ShoppingIcon/supermercado (1).png",
    "assets/images/ShoppingIcon/supermercados.png",
    "assets/images/ShoppingIcon/tienda-de-comestibles.png",
    "assets/images/ShoppingIcon/tienda-de-comestibles (1).png",
    "assets/images/ShoppingIcon/verduras.png",
    "assets/images/ShoppingIcon/verduras (1).png"
  ];
  List<String>? SportsEmoji=[
    "assets/images/SportsIcon/beisbol.png",
    "assets/images/SportsIcon/bicicleta.png",
    "assets/images/SportsIcon/campo-de-golf.png",
    "assets/images/SportsIcon/cesta.png",
    "assets/images/SportsIcon/ciclismo.png",
    "assets/images/SportsIcon/corriendo.png",
    "assets/images/SportsIcon/formula.png",
    "assets/images/SportsIcon/guante-de-boxeo.png",
    "assets/images/SportsIcon/hockey-sobre-hielo.png",
    "assets/images/SportsIcon/jugador-de-cricket.png",
    "assets/images/SportsIcon/nadador.png",
    "assets/images/SportsIcon/natacion.png",
    "assets/images/SportsIcon/pelota-de-baloncesto.png",
    "assets/images/SportsIcon/rugby.png",
    "assets/images/SportsIcon/sayo.png",
    "assets/images/SportsIcon/skate.png",
    "assets/images/SportsIcon/snowboard.png",
    "assets/images/SportsIcon/tenis.png",
    "assets/images/SportsIcon/tenis-de-mesa.png",
    "assets/images/SportsIcon/voleibol.png"
  ];
  List<String>? StatisticsEmoji=[
    "assets/images/StatisticsIcon/analitica.png",
    "assets/images/StatisticsIcon/analitica (1).png",
    "assets/images/StatisticsIcon/analitica (2).png",
    "assets/images/StatisticsIcon/diagrama.png",
    "assets/images/StatisticsIcon/diseno-grafico.png",
    "assets/images/StatisticsIcon/disminucion.png",
    "assets/images/StatisticsIcon/el-diseno-del-arte.png",
    "assets/images/StatisticsIcon/estadisticas.png",
    "assets/images/StatisticsIcon/grafico.png",
    "assets/images/StatisticsIcon/grafico (1).png",
    "assets/images/StatisticsIcon/grafico-de-barras.png",
    "assets/images/StatisticsIcon/grafico-de-barras (1).png",
    "assets/images/StatisticsIcon/grafico-de-barras (2).png",
    "assets/images/StatisticsIcon/infografia.png",
    "assets/images/StatisticsIcon/investigacion.png",
    "assets/images/StatisticsIcon/investigacion (1).png",
    "assets/images/StatisticsIcon/presentacion.png",
    "assets/images/StatisticsIcon/reporte-de-negocios.png",
    "assets/images/StatisticsIcon/riesgo.png",
    "assets/images/StatisticsIcon/tabla-de-onda.png",
    "assets/images/StatisticsIcon/tendencia.png"
  ];
  List<String>? StudiesEducationEmoji=[
    "assets/images/StudiesEducationIcon/alojamiento.png",
    "assets/images/StudiesEducationIcon/aprender-en-linea.png",
    "assets/images/StudiesEducationIcon/autobus-escolar.png",
    "assets/images/StudiesEducationIcon/boligrafo.png",
    "assets/images/StudiesEducationIcon/calculadora.png",
    "assets/images/StudiesEducationIcon/certificado.png",
    "assets/images/StudiesEducationIcon/colegio.png",
    "assets/images/StudiesEducationIcon/costo-de-educacion.png",
    "assets/images/StudiesEducationIcon/fotocopia.png",
    "assets/images/StudiesEducationIcon/fotocopiadora.png",
    "assets/images/StudiesEducationIcon/gobernante.png",
    "assets/images/StudiesEducationIcon/lapiz.png",
    "assets/images/StudiesEducationIcon/libro.png",
    "assets/images/StudiesEducationIcon/libro (1).png",
    "assets/images/StudiesEducationIcon/libro-abierto.png",
    "assets/images/StudiesEducationIcon/matricula.png",
    "assets/images/StudiesEducationIcon/ordenador-portatil.png",
    "assets/images/StudiesEducationIcon/paleta-de-pintura.png",
    "assets/images/StudiesEducationIcon/plano.png",
    "assets/images/StudiesEducationIcon/profesor.png",
    "assets/images/StudiesEducationIcon/profesor (1).png",
    "assets/images/StudiesEducationIcon/tableta.png",
    "assets/images/StudiesEducationIcon/universidad.png"
  ];
  List<String>? SubscriptionEmoji=[
    "assets/images/SubscriptionIcon/app.png",
    "assets/images/SubscriptionIcon/banda-sonora.png",
    "assets/images/SubscriptionIcon/calendario.png",
    "assets/images/SubscriptionIcon/computacion-en-la-nube.png",
    "assets/images/SubscriptionIcon/consola-de-juego.png",
    "assets/images/SubscriptionIcon/distintivo.png",
    "assets/images/SubscriptionIcon/escucha.png",
    "assets/images/SubscriptionIcon/favoritos.png",
    "assets/images/SubscriptionIcon/libro-digital.png",
    "assets/images/SubscriptionIcon/mujer.png",
    "assets/images/SubscriptionIcon/nota-musical.png",
    "assets/images/SubscriptionIcon/palanca-de-mando.png",
    "assets/images/SubscriptionIcon/periodico.png",
    "assets/images/SubscriptionIcon/reproductor-de-video.png",
    "assets/images/SubscriptionIcon/revista.png",
    "assets/images/SubscriptionIcon/software.png",
    "assets/images/SubscriptionIcon/suscripcion.png"
  ];
  List<String>? TransportEmoji=[
    "assets/images/TransportIcon/autobus.png",
    "assets/images/TransportIcon/autobus (1).png",
    "assets/images/TransportIcon/autobus-escolar (1).png",
    "assets/images/TransportIcon/avion.png",
    "assets/images/TransportIcon/avion (1).png",
    "assets/images/TransportIcon/avion (2).png",
    "assets/images/TransportIcon/barco (1).png",
    "assets/images/TransportIcon/barco (4).png",
    "assets/images/TransportIcon/bicicleta.png",
    "assets/images/TransportIcon/bicicleta (1).png",
    "assets/images/TransportIcon/bomba de gas 5.png",
    "assets/images/TransportIcon/bomba de gas 47.png",
    "assets/images/TransportIcon/bomba-de-gas (1).png",
    "assets/images/TransportIcon/camion (1).png",
    "assets/images/TransportIcon/camion (2).png",
    "assets/images/TransportIcon/camion-grua.png",
    "assets/images/TransportIcon/carro (2).png",
    "assets/images/TransportIcon/carro (4).png",
    "assets/images/TransportIcon/carro (5).png",
    "assets/images/TransportIcon/carro (7).png",
    "assets/images/TransportIcon/carro (10).png",
    "assets/images/TransportIcon/carro (12).png",
    "assets/images/TransportIcon/carro (13).png",
    "assets/images/TransportIcon/carro electrico 2.png",
    "assets/images/TransportIcon/carro 55.png",
    "assets/images/TransportIcon/casco-de-carreras.png",
    "assets/images/TransportIcon/embarcacion.png",
    "assets/images/TransportIcon/entrenar.png",
    "assets/images/TransportIcon/gasolina.png",
    "assets/images/TransportIcon/helicoptero.png",
    "assets/images/TransportIcon/lavado-de-autos (1).png",
    "assets/images/TransportIcon/mantenimiento (1).png",
    "assets/images/TransportIcon/mensajero (2).png",
    "assets/images/TransportIcon/moto.png",
    "assets/images/TransportIcon/moto (1).png",
    "assets/images/TransportIcon/motocicleta.png",
    "assets/images/TransportIcon/motocicleta (1).png",
    "assets/images/TransportIcon/neumatico.png",
    "assets/images/TransportIcon/parking.png",
    "assets/images/TransportIcon/peaje.png",
    "assets/images/TransportIcon/peaje (2).png",
    "assets/images/TransportIcon/scooter-electrico.png",
    "assets/images/TransportIcon/semi.png",
    "assets/images/TransportIcon/taxi (1).png",
    "assets/images/TransportIcon/taxi (2).png",
    "assets/images/TransportIcon/taxi (3).png",
    "assets/images/TransportIcon/tractores.png",
    "assets/images/TransportIcon/transporte-publico.png",
    "assets/images/TransportIcon/transporte-publico (1).png",
    "assets/images/TransportIcon/uber.png",
    "assets/images/TransportIcon/uber (1).png",
    "assets/images/TransportIcon/uber (2).png",
    "assets/images/TransportIcon/volante.png"
  ];
  List<String>? UsersEmoji=[
    "assets/images/UsersIcon/administrador.png",
    "assets/images/UsersIcon/administrador (1).png",
    "assets/images/UsersIcon/africano.png",
    "assets/images/UsersIcon/avatar.png",
    "assets/images/UsersIcon/avatar (1).png",
    "assets/images/UsersIcon/avatar (2).png",
    "assets/images/UsersIcon/chico.png",
    "assets/images/UsersIcon/enfermero.png",
    "assets/images/UsersIcon/farmaceutico.png",
    "assets/images/UsersIcon/hombre (1).png",
    "assets/images/UsersIcon/hombre (2).png",
    "assets/images/UsersIcon/hombre (3).png",
    "assets/images/UsersIcon/hombre (4).png",
    "assets/images/UsersIcon/mujer.png",
    "assets/images/UsersIcon/mujer (1).png",
    "assets/images/UsersIcon/mujer (2).png",
    "assets/images/UsersIcon/mujer (3).png",
    "assets/images/UsersIcon/mujer (4).png",
    "assets/images/UsersIcon/mujer (5).png",
    "assets/images/UsersIcon/mujer (6).png",
    "assets/images/UsersIcon/mujer GFF.png",
    "assets/images/UsersIcon/mujer-de-negocios.png",
    "assets/images/UsersIcon/nina.png",
    "assets/images/UsersIcon/nino.png",
    "assets/images/UsersIcon/personal.png",
    "assets/images/UsersIcon/usuario.png",
    "assets/images/UsersIcon/usuario (1).png",
    "assets/images/UsersIcon/usuario (2).png"
  ];
  List<String>? VacationEmoji=[
    "assets/images/VacationIcon/autobus.png",
    "assets/images/VacationIcon/bailando.png",
    "assets/images/VacationIcon/bailando (1).png",
    "assets/images/VacationIcon/bicicleta-de-montana.png",
    "assets/images/VacationIcon/bolsa-de-la-compra.png",
    "assets/images/VacationIcon/botiquin-medico.png",
    "assets/images/VacationIcon/cama-de-hotel.png",
    "assets/images/VacationIcon/camara-reflex-digital.png",
    "assets/images/VacationIcon/camping.png",
    "assets/images/VacationIcon/cinco-de-mayo.png",
    "assets/images/VacationIcon/cocina.png",
    "assets/images/VacationIcon/cuchillo.png",
    "assets/images/VacationIcon/de-viaje.png",
    "assets/images/VacationIcon/embarque.png",
    "assets/images/VacationIcon/entradas-de-cine.png",
    "assets/images/VacationIcon/hotel.png",
    "assets/images/VacationIcon/mansion.png",
    "assets/images/VacationIcon/mapa.png",
    "assets/images/VacationIcon/montana-rusa.png",
    "assets/images/VacationIcon/parque-de-atracciones.png",
    "assets/images/VacationIcon/proteccion.png",
    "assets/images/VacationIcon/restaurante.png",
    "assets/images/VacationIcon/seguridad-informatica.png",
    "assets/images/VacationIcon/tarjeta-de-embarque.png",
    "assets/images/VacationIcon/tejido-de-punto.png",
    "assets/images/VacationIcon/tenedor.png",
    "assets/images/VacationIcon/tren.png",
    "assets/images/VacationIcon/tren-electrico.png",
    "assets/images/VacationIcon/tubo-respirador.png",
    "assets/images/VacationIcon/vacaciones.png"
  ];



String? _selectedEmoji;
String? get selectedEmoji=>_selectedEmoji;

String? _globalCategories;
String? get globalCategories=>_globalCategories;

// List<CategoryModel>? _selectedCatSubCatList;
// List<CategoryModel>? get selectedCatSubCatList=>_selectedCatSubCatList;

// String? _selectedList;
// String? get selectedList=>_selectedList;






// onListUpdate(List<String>? list)async{
//   _selectedCatSubCatList = list;
//   update();
// }

onChangeGlobleCategories(String? value)async{
_globalCategories = value;
  update();

}


setSelectedImage(image)async{
  _selectedEmoji = image;
  // selectedList?.add(_selectedEmoji??"");
  update();
}




}