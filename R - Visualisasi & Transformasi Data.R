library(readr)
# membaca file
sampel <- read_csv('D:/PRAKTIKUM R/Nilai.csv')
View(sampel)
head(sampel)
summary(sampel)


Math <- (sampel$Math)
Math

# steam
stem(Math)

#boxplot
bp <- boxplot(Math, ylab = 'Nilai Mahasiswa')
text(1.3, bp$stats, paste(c("Lower Fence = ", 
                            "Q1 = ", "Median = ",
                            "Q3 = ", "Upper Fence = "), 
                          bp$stats))
qqnorm(Math)
qqline(Math, col = 'blue')

Ing <- (sampel$Inggris)
Ing
stem(Ing)
bp1 <- boxplot(Ing, ylab = 'Nilai Mahasiswa')
text(1.3, bp1$stats, paste(c("Lower Fence = ",
                             "Q1 = ", "Median = ",
                             "Q3 = ", "Upper Fence = "),
                           bp1$stats))
qqnorm(Ing)
qqline(Ing, col = 'green')

Indo <- (sampel$Indonesia)
Indo
stem(Indo)
bp2 <- boxplot(Indo, ylab = 'Nilai Mahasiswa')
text(1.3, bp2$stats, paste(c("Lower Fence = ",
                             "Q1 = ", "Median = ",
                             "Q3 = ", "Upper Fence = "),
                           bp2$stats))
qqnorm(Indo)
qqline(Indo, col = 'red')

library(aplpack)
stem.leaf.backback(Math, Indo)
stem.leaf.backback(Math, Ing)
stem.leaf.backback(Ing, Indo)

boxplot(Math,Indo)
boxplot(Math,Ing)
boxplot(Ing,Indo)
boxplot(Math, Ing, Indo)

boxplot(Math~Jenis_Kelamin,
        data = sampel,
        main="Nilai Test Matematika Bersadarkan Jenis Kelamin",
        ylab = 'Nilai Test Matematika',
        xlab ='Jenis Kelamin',
        col="steelblue",
        border="black")
boxplot(Math~Kelas,
        data=sampel,
        main="Nilai Test Matematika Bersadarkan Kelas",
        xlab="Kelas",
        ylab="Nilai Test Matematika",
        col="steelblue",
        border="black")

boxplot(Inggris~Jenis_Kelamin,
        data = sampel,
        main="Nilai Test Bahasa Inggris Bersadarkan Jenis Kelamin",
        ylab = 'Nilai Test Bahasa Inggris',
        xlab ='Jenis Kelamin',
        col="steelblue",
        border="black")
boxplot(Inggris~Kelas,
        data = sampel,
        main="Nilai Test Bahasa Inggris Bersadarkan Kelas",
        ylab = 'Nilai Test Bahasa Inggris',
        xlab ='Kelas',
        col="steelblue",
        border="black")

boxplot(Indonesia~Jenis_Kelamin,
        data = sampel,
        main="Nilai Test Bahasa Indonesia Bersadarkan Jenis Kelamin",
        ylab = 'Nilai Test Bahasa Indonesia',
        xlab = 'Jenis_Kelamin',
        col="steelblue",
        border="black")
boxplot(Indonesia~Kelas, 
        data = sampel,
        main="Nilai Test Bahasa Indonesia Bersadarkan Kelas",
        ylab = 'Nilai Test Bahasa Indonesia',
        xlab ='Kelas',
        col="steelblue",
        border="black")

qqplot(Math, Indo)
qqplot(Math, Ing)
qqplot(Ing, Indo)

library(ggplot2)
ggplot(sampel, aes(x = Math, y = Inggris))+
  geom_point(aes(color = Kelas))

ggplot(sampel, aes(x = Math, y = Inggris))+
  geom_point(aes(color = Jenis_Kelamin))

ggplot(sampel, aes(x = Math, y = Indonesia))+
  geom_point(aes(color = Kelas))

ggplot(sampel, aes(x = Math, y = Indonesia))+
  geom_point(aes(color = Jenis_Kelamin))

ggplot(sampel, aes(x = Indonesia, y = Inggris))+
  geom_point(aes(color = Kelas))

ggplot(sampel, aes(x = Indonesia, y = Inggris))+
  geom_point(aes(color = Jenis_Kelamin))

ggplot(sampel, aes(x = Math, y = Inggris))+
  geom_boxplot(aes(color = Kelas))

ggplot(sampel, aes(x = Math, y = Inggris))+
  geom_boxplot(aes(color = Jenis_Kelamin))

ggplot(sampel, aes(x = Math, y = Indonesia))+
  geom_boxplot(aes(color = Kelas))

ggplot(sampel, aes(x = Math, y = Indonesia))+
  geom_boxplot(aes(color = Jenis_Kelamin))

ggplot(sampel, aes(x = Indonesia, y = Inggris))+
  geom_boxplot(aes(color = Kelas))

ggplot(sampel, aes(x = Indonesia, y = Inggris))+
  geom_boxplot(aes(color = Jenis_Kelamin))

#Transformasi

sampel1 <- read_csv('D:/PRAKTIKUM R/Produktivitas.csv')
sampel1

produktivitas <- sampel1$Produktivitas
produktivitas

stem(produktivitas)

bp3 <- boxplot(produktivitas, ylab='Unit per Hari')
text(1.3, bp3$stats, paste(c("Lower Fence=", "Q1=",
                             "Median=", "Q3=",
                             "Upper Fence="), 
                           bp3$stats))
text(1.3, min(produktivitas), 
     paste("Minimum=", min(produktivitas)))

boxplot(produktivitas, ylab = "Unit/Hari")
stripchart(produktivitas, method = "stack", 
           pch = 20, offset = 0.8, vertical = T, 
           add = T)

produktivitas2 <- log(produktivitas)
produktivitas2
boxplot(produktivitas2)

produktivitas1 <- sin(produktivitas)
produktivitas1

bp4 <- boxplot(produktivitas1, ylab='Unit per Hari')
text(1.3, bp4$stats, paste(c("Lower Fence=", "Q1=",
                             "Median=", "Q3=",
                             "Upper Fence="), 
                           bp4$stats))
