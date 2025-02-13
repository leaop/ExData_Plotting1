# Carregar pacotes necessários
library(data.table)

# Carregar os dados
power <- fread("household_power_consumption.txt", sep = ";", na.strings = "?", data.table = FALSE)

# Converter data para formato Date
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")

# Filtrar os dados para 1 e 2 de fevereiro de 2007
power_subset <- subset(power, Date == "2007-02-01" | Date == "2007-02-02")

# Converter Global_active_power para numérico
power_subset$Global_active_power <- as.numeric(power_subset$Global_active_power)

# Criar o gráfico
png("plot1.png", width = 480, height = 480)
hist(power_subset$Global_active_power, col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency")
dev.off()
