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
	Escribir "¡Bienvenido a la plataforma, ",clientes[contback,1],"!";
	Si clientes[contback,6] = "0" Entonces
		Escribir "Rol = usuario.";
	SiNo
		Escribir "Rol = administrador.";
	FinSi
FinSubProceso

SubProceso pedirDatosUsuario(clientes,numuser)
	Definir cont1, cont2 como entero;
	Para cont1<-0 Hasta numuser-1 Con Paso 1 Hacer
		Para cont2<-0 Hasta 6 Con Paso 1 Hacer
			Segun cont2 Hacer
				0:
					Escribir "Introduzca el DNI del usuario ",cont1+1;
					Leer clientes[cont1,cont2];
				1:
					Escribir "Introduzca el nombre del usuario ",cont1+1;
					Leer clientes[cont1,cont2];
				2:
					Escribir "Introduzca los apellidos del usuario ",cont1+1;
					Leer clientes[cont1,cont2];
				3: 
					Escribir "Introduzca el domicilio del usuario ",cont1+1;
					Leer clientes[cont1,cont2];
				4: 
					Escribir "Introduzca la localidad del usuario ",cont1+1;
					Leer clientes[cont1,cont2];
				5: 
					Escribir "Introduzca la provincia del usuario ",cont1+1;
					Leer clientes[cont1,cont2];
				6: 
					Escribir "Introduzca el rol del usuario ",cont1+1, " (0.- Usuario corriente, 1.- Administrador)";
					Leer clientes[cont1,cont2];
			FinSegun
		FinPara
	FinPara
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

SubProceso sacarCD(cd,clientes,contback, alquiler Por Referencia)
	Definir user como caracter;
	Definir temp como entero;
	Escribir sin saltar "Introduce el código del disco que deseas alquilar: ";
	Leer user;
	temp <- ConvertirANumero(cd[user,5]) - 1;
	cd[user,5] <- ConvertirATexto(temp);
	alquiler[0,0] <- user;
	alquiler[0,1] <- clientes[contback,0];
	Escribir "¡Alquiler realizado con éxito!";
FinSubProceso

Proceso GestionCDs
	Definir clientes, cd, alquiler como caracter;
	Definir numuser como real; // Cantidad de usuarios totales en el sistema.
	Definir contback, numcd como entero; // Variable 1 del vector CLIENTES donde se encuentra el usuario que inicia sesión.
	contback <- 0;
	numcd <- 0;
	Dimension clientes[100,7]; // Vector para guardar la información de todos los usuarios.
	Dimension cd[250,6]; // Vector para almacenar los CDs disponibles y su información.
	prebuiltCDs(cd,numcd);
	Dimension alquiler[1000,2]; // Vector para guardar información sobre los alquileres realizados.
	Escribir "Introduce el número de usuarios de la tienda (máximo = 100).";
	Leer numuser;
	pedirDatosUsuario(clientes,numuser);
	pedirUsuario(clientes,numuser, contback);
	Si clientes[contback,6] = "0" Entonces
		listadoCDs(cd,numcd);
		sacarCD(cd,clientes,contback,alquiler);
	FinSi
FinProceso