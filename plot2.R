# Carregar pacotes necessários
library(data.table)

# Carregar os dados
power <- fread("household_power_consumption.txt", sep = ";", na.strings = "?", data.table = FALSE)

# Converter data para formato Date
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")

# Filtrar os dados para 1 e 2 de fevereiro de 2007
power_subset <- subset(power, Date == "2007-02-01" | Date == "2007-02-02")

# Criar uma nova variável de data/hora
power_subset$DateTime <- as.POSIXct(paste(power_subset$Date, power_subset$Time), format = "%Y-%m-%d %H:%M:%S")

# Criar o gráfico
png("plot2.png", width = 480, height = 480)
plot(power_subset$DateTime, power_subset$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)", 
     main = "Global Active Power over Time")
dev.off()
