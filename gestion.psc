SubProceso prebuiltCDs(cd,numcd Por Referencia) // códigoCD, nombre, artista, género, localización, ejemplares
	cd[0,0] <- "0";
	cd[0,1] <- "Nadar";
	cd[0,2] <- "Manolito";
	cd[0,3] <- "Punk";
	cd[0,4] <- "24";
	cd[0,5] <- "7";
	cd[1,0] <- "1";
	cd[1,1] <- "Libre";
	cd[1,2] <- "Juana";
	cd[1,3] <- "Indie";
	cd[1,4] <- "07";
	cd[1,5] <- "5";
	cd[2,0] <- "2";
	cd[2,1] <- "Nadie";
	cd[2,2] <- "Solos bien solos";
	cd[2,3] <- "Pop";
	cd[2,4] <- "11";
	cd[2,5] <- "3";
	cd[3,0] <- "3";
	cd[3,1] <- "Mola";
	cd[3,2] <- "Rockers";
	cd[3,3] <- "Rock";
	cd[3,4] <- "02";
	cd[3,5] <- "2";
	cd[4,0] <- "4";
	cd[4,1] <- "Volar";
	cd[4,2] <- "QWERTY";
	cd[4,3] <- "Pop";
	cd[4,4] <- "16";
	cd[4,5] <- "9";
	numcd <- 4;
FinSubProceso

SubProceso pedirUsuario(clientes,numuser, contback Por Referencia)
	Definir user como caracter; // Variable donde se guarda el DNI del usuario.
	Definir cont como entero;
	Definir entrada como logico;
	entrada <- falso; // Falso hasta que se encuentre el DNI en el sistema.
	Escribir "Introduzca su DNI";
	Leer user;
	Para cont <- 0 Hasta numuser-1 Con Paso 1 Hacer
		Si clientes[cont,0] = user Entonces
			entrada <- verdadero;
			contback <- cont;
			cont <- numuser-1;
		FinSi
	FinPara
	Si entrada = falso Entonces
		Escribir "No se ha encontrado un cliente con ese DNI. Vamos a registrarte en la plataforma.";
		Para cont <- 0 Hasta 6 Con Paso 1 Hacer
			Segun cont Hacer
				0:
					Escribir "Introduzca el DNI del usuario";
					Leer clientes[numuser,cont];
				1:
					Escribir "Introduzca el nombre del usuario";
					Leer clientes[numuser,cont];
				2:
					Escribir "Introduzca los apellidos del usuario";
					Leer clientes[numuser,cont];
				3: 
					Escribir "Introduzca el domicilio del usuario";
					Leer clientes[numuser,cont];
				4: 
					Escribir "Introduzca la localidad del usuario";
					Leer clientes[numuser,cont];
				5: 
					Escribir "Introduzca la provincia del usuario";
					Leer clientes[numuser,cont];
				6: 
					Escribir "Introduzca el rol del usuario (0.- Usuario corriente, 1.- Administrador)";
					Leer clientes[numuser,cont];
					contback <- numuser;
			FinSegun
		FinPara
	FinSi
	Escribir "¡Bienvenido a la plataforma, ",clientes[contback,0],"!";
	Si clientes[contback,6] = "0" Entonces
		Escribir "Rol = usuario.";
	SiNo
		Escribir "Rol = administrador.";
	FinSi
FinSubProceso

SubProceso DNIsAlmacenados(clientes,numuser Por Referencia)
	clientes[0,0] <- "98765432X";
	clientes[0,1] <- "Juan";
	clientes[0,6] <- "0";
	clientes[1,0] <- "12345678A";
	clientes[1,1] <- "Lola";
	clientes[1,6] <- "0";
	clientes[2,0] <- "88888888H";
	clientes[2,1] <- "Javier";
	clientes[2,6] <- "1";
	clientes[3,0] <- "77691163S";
	clientes[3,1] <- "Manuel";
	clientes[3,6] <- "1";
	clientes[4,0] <- "00000000B";
	clientes[4,1] <- "Esteban";
	clientes[4,6] <- "0";
	numuser <- 4;
FinSubProceso

SubProceso listadoCDs(cd,numcd)
	Definir cont, cont2 como entero;
	Para cont <- 0 Hasta numcd Con Paso 1 Hacer
		Para cont2 <- 0 Hasta 5 Con Paso 1 Hacer
			Segun cont2 Hacer
				0:
					Escribir "";
					Escribir "Código del disco: ",cd[cont,cont2];
				1:
					Escribir "Nombre del disco: ",cd[cont,cont2];
				2:
					Escribir "Artista/grupo del disco: ",cd[cont,cont2];
				3:
					Escribir "Género del disco: ",cd[cont,cont2];
				4:
					Escribir "Estantería: ",cd[cont,cont2];
				5:
					Escribir "Ejemplares del disco: ",cd[cont,cont2];
			FinSegun
		FinPara
	FinPara
	Escribir "";
FinSubProceso

SubProceso sacarCD(cd,clientes,contback, alquiler Por Referencia, alquileres Por Referencia)
	Definir user como caracter;
	Definir temp como entero;
	Escribir sin saltar "Introduce el código del disco que deseas alquilar: ";
	Leer user;
	temp <- ConvertirANumero(cd[user,5]) - 1;
	cd[user,5] <- ConvertirATexto(temp);
	alquiler[0,0] <- user;
	alquiler[0,1] <- clientes[contback,0];
	alquileres <- alquileres + 1;
	Escribir "¡Alquiler realizado con éxito!";
FinSubProceso

SubProceso AnadirCD(cd,numcd)
	Definir cont, cont2 como entero;
	Escribir "Vamos a añadir los datos del nuevo CD.";
	numcd <- numcd + 1;
	Para cont <- numcd Hasta numcd Con Paso 1 Hacer
		Para cont2 <- 0 Hasta 5 Con Paso 1 Hacer
			Segun cont2 Hacer
				0:
					Escribir "";
					cd[cont,cont2] <- ConvertirATexto(numcd);
					Escribir "Código del disco: ",cd[cont,cont2];
				1:
					Escribir sin saltar "Nombre del disco: ";
					Leer cd[cont,cont2];
				2:
					Escribir sin saltar "Artista/grupo del disco: ";
					Leer cd[cont,cont2];
				3:
					Escribir sin saltar "Género del disco: ";
					Leer cd[cont,cont2];
				4:
					Escribir sin saltar "Estantería: ";
					Leer cd[cont,cont2];
				5:
					Escribir sin saltar "Ejemplares del disco: ";
					Leer cd[cont,cont2];
			FinSegun
		FinPara
	FinPara
FinSubProceso

SubProceso ModificarCD(cd,user Por Referencia)
	Definir cont, cont2 como entero;
	Escribir sin saltar "Vamos a modificar los datos del CD (código) que escogas: ";
	Leer user;
	Para cont <- user Hasta user Con Paso 1 Hacer
		Para cont2 <- 0 Hasta 5 Con Paso 1 Hacer
			Segun cont2 Hacer
				0:
					Escribir "";
					Escribir "Código del disco: ",cd[cont,cont2];
				1:
					Escribir sin saltar "Nombre del disco: ";
					Leer cd[cont,cont2];
				2:
					Escribir sin saltar "Artista/grupo del disco: ";
					Leer cd[cont,cont2];
				3:
					Escribir sin saltar "Género del disco: ";
					Leer cd[cont,cont2];
				4:
					Escribir sin saltar "Estantería: ";
					Leer cd[cont,cont2];
				5:
					Escribir sin saltar "Ejemplares del disco: ";
					Leer cd[cont,cont2];
			FinSegun
		FinPara
	FinPara
FinSubProceso

SubProceso EliminarCD(cd,numcd,user)
	Definir cont, cont2 como entero;
	Escribir sin saltar "Vamos a eliminar el CD (código) que escogas de la lista anterior: ";
	Leer user;
	numcd <- numcd - 1;
	Para cont <- user Hasta numcd Con Paso 1 Hacer
		Para cont2 <- 0 Hasta 5 Con Paso 1 Hacer
			Segun cont2 Hacer
				0:
					Escribir "";
					cd[cont,cont2] <- cd[cont+1,cont2];
				1:
					cd[cont,cont2] <- cd[cont+1,cont2];
				2:
					cd[cont,cont2] <- cd[cont+1,cont2];
				3:
					cd[cont,cont2] <- cd[cont+1,cont2];
				4:
					cd[cont,cont2] <- cd[cont+1,cont2];
				5:
					cd[cont,cont2] <- cd[cont+1,cont2];
			FinSegun
		FinPara
	FinPara
	Escribir "¡Hecho!";
FinSubProceso

SubProceso mostrarPorGenero(cd,numcd)
	Definir cont como entero;
	Escribir "Discos de rock:";
	Para cont<-0 Hasta numcd Con Paso 1 Hacer
		Si cd[cont,3] = "Rock" Entonces
			Escribir cd[cont,1], " - " ,cd[cont,2];
		FinSi
	FinPara
	Escribir "";
	Escribir "Discos de pop:";
	Para cont<-0 Hasta numcd Con Paso 1 Hacer
		Si cd[cont,3] = "Pop" Entonces
			Escribir cd[cont,1], " - " ,cd[cont,2];
		FinSi
	FinPara
	Escribir "";
	Escribir "Discos de punk:";
	Para cont<-0 Hasta numcd Con Paso 1 Hacer
		Si cd[cont,3] = "Punk" Entonces
			Escribir cd[cont,1], " - " ,cd[cont,2];
		FinSi
	FinPara
	Escribir "";
	Escribir "Discos de indie:";
	Para cont<-0 Hasta numcd Con Paso 1 Hacer
		Si cd[cont,3] = "Indie" Entonces
			Escribir cd[cont,1], " - " ,cd[cont,2];
		FinSi
	FinPara
	Escribir "";
FinSubProceso

SubProceso listadoClientes(clientes,numuser)
	Definir cont como entero;
	Para cont <- 0 Hasta numuser Con Paso 1 Hacer
		Si clientes[cont,6] = "0" Entonces
			Escribir "Nombre: " ,clientes[cont,1];
			Escribir "DNI: " ,clientes[cont,0];
			Escribir "";
		FinSi
	FinPara
FinSubProceso

SubProceso alquileresEnCurso(alquiler,alquileres)
	Definir cont como entero;
	Para cont <- 0 Hasta alquileres-1 Con Paso 1 Hacer
		Escribir "Disco alquilado: ",alquiler[cont,0];
		Escribir "Cliente: ",alquiler[cont,0];
		Escribir "";
	FinPara
FinSubProceso

Proceso GestionCDs
	Definir clientes, cd, alquiler como caracter;
	Definir numuser como real; // Cantidad de usuarios totales en el sistema.
	Definir contback, numcd, user, alquileres como entero; // Variable 1 del vector CLIENTES donde se encuentra el usuario que inicia sesión.
	contback <- 0;
	numcd <- 0;
	user <- 0;
	alquileres <- 0;
	Dimension clientes[100,7]; // Vector para guardar la información de todos los usuarios.
	Dimension cd[250,6]; // Vector para almacenar los CDs disponibles y su información.
	prebuiltCDs(cd,numcd);
	Dimension alquiler[1000,2]; // Vector para guardar información sobre los alquileres realizados.
	DNIsAlmacenados(clientes,numuser);
	pedirUsuario(clientes,numuser, contback);
	Si clientes[contback,6] = "0" Entonces
		Escribir "Como cliente, tienes la posibilidad de hacer las siguientes operaciones:";
		Escribir "1. Alquilar un CD.";
		Escribir "2. Ordenar los CDs disponibles por su género.";
		Escribir "0. Salir del programa.";
		Leer user;
		Mientras user <> 0 Hacer
			Segun user Hacer
				1:
					listadoCDs(cd,numcd);
					sacarCD(cd,clientes,contback,alquiler,alquileres);
				2:
					mostrarPorGenero(cd,numcd);
				De Otro Modo:
					Escribir "No has introducido un número del programa válido. Recuerda que sólo puedes introducir 0, 1 o 2.";
			FinSegun
			Escribir "...Terminado. Ahora introduce el número de otra operación (para terminar = 0).";
			Leer user;
		FinMientras
	SiNo
		Escribir "Como administrador, tienes la posibilidad de hacer las siguientes operaciones:";
		Escribir "1. Añadir un CD a la lista.";
		Escribir "2. Modificar un CD de la lista.";
		Escribir "3. Eliminar un CD de la lista.";
		Escribir "4. Listado de los clientes.";
		Escribir "5. Mostrar alquieres en curso.";
		Escribir "0. Salir del programa.";
		Leer user;
		Mientras user <> 0 Hacer
			Segun user Hacer
				1:
					AnadirCD(cd,numcd);
				2:
					listadoCDs(cd,numcd);
					ModificarCD(cd,user);
				3:
					listadoCDs(cd,numcd);
					EliminarCD(cd,numcd,user);
				4:
					listadoClientes(clientes,numuser);
				5:
					alquileresEnCurso(alquiler,alquileres);
				De Otro Modo:
					Escribir "No has introducido un número del programa válido. Recuerda que sólo puedes introducir 0, 1, 2 o 3.";
			FinSegun
			Escribir "...Terminado. Ahora introduce el número de otra operación (para terminar = 0).";
			Leer user;
		FinMientras
	FinSi
FinProceso