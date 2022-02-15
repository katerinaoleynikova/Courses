# Задание 1.

pines = c(7,12,9,17,10,13,15) # число взрослых сосен, посчитанных на 7 участках
X_squared = chisq.test(pines) # X-squared = 6,1446
X_squared
#
E = mean(pines) # ожидаемое - 11,85714
chi_squared = ((7-E)**2 + (12-E)**2 + (9-E)**2 + (17-E)**2 + (10-E)**2 +(13-E)**2 + (15-E)**2)/E # 6,144578
chi_squared
#
df = 7 - 1 # df = 6 (степень свободы)
#
X_squared$statistic < 12.592 # true
chi_squared < 12.592 # true => результаты для обоих способов одинаковы
#
X_squared$p.value # p value = 0,407
X_squared$p.value > 0.05 # true => основание принять нулевую гипотезу Н0

# Задание 2.

X <- matrix(c(20, 32, 30, 18), ncol = 2) # построим таблицу сопряжённости 2х2
X
chisq.test(X) # p-value = 0,02768
fisher.test(X) # p-value = 0,02718

# Задание 3.

Nucleotides = 29903 
Thymines = 9594
Adenines = 8954
Guanines = 5863
Cytosines = 5492
TA_frequency1 = 2377

TA_probability2 = Thymines/Nucleotides * Adenines/Nucleotides # 0,09606989
TA_probability2

# Теоретическая (ожидаемая) частота ТА в геноме 
TA_frequency2 = TA_probability2*Nucleotides # 2872,778
TA_frequency2 # f = 2872,778

# Фактическая вероятность появления ТА в геноме
TA_probability1 = TA_frequency1/Nucleotides
TA_probability1 # 0,07949035

# Z-статистика
TA_dispersion1 = TA_frequency1*TA_probability1*(1-TA_probability1)
TA_dispersion1 # 173,929
TA_dispersion2 = TA_frequency2*TA_probability2*(1-TA_probability2)
TA_dispersion2 # 249,4734
Z = (TA_probability2 - TA_probability1)/sqrt(TA_dispersion1 + TA_dispersion2)
Z # 0,0008057415

# Задание 4.

temperatures = read.csv("/Users/katerinaoleynikova/Desktop/statistics-tasks-2.4.txt", header = TRUE)
#temperatures
mean_temperature_before = 61.5
temperatures_after = temperatures$Temperature..centigrades.
#temperatures_after
length(temperatures_after) # 19 значений

# Применение критерия нормальности Шапиро-Уилка / Проверка на нормальное распределение данных в выборке
norm_distribution = shapiro.test(temperatures_after)
norm_distribution # p-value = 0,1655
norm_distribution$p.value > 0.05 # true
# Применение критерия Стьюдента (t-test)
st = t.test(temperatures_after, mu = mean_temperature_before)
st
st$p.value # p-value = 0,08029

# Задание 5.

tensions = read.csv2("/Users/katerinaoleynikova/Desktop/statistics-tasks-2.5.txt", header=TRUE, fileEncoding="latin1")
#tensions
tension1 = as.numeric(gsub(",",".", tensions[1:24,]))
tension2 = as.numeric(gsub(",",".", tensions[26:45,]))
data = data.frame(group = rep(c("factory1","factory2"),c(length(tension1),length(tension2))), tension = c(tension1,tension2))
#data

# Применение критерия нормальности Шапиро-Уилка / Проверка на нормальное распределение данных в выборках
norm_distribution1 = shapiro.test(tension1)
norm_distribution1$p.value # 0,5577542
norm_distribution1$p.value > 0.05 # true -> Данные в выборке 1 нормально распределены
norm_distribution2 = shapiro.test(tension2)
norm_distribution2$p.value # 0,9770393
norm_distribution2$p.value > 0.05 # true -> Данные в выборке 2 нормально распределены

# Способ 1: # Двувыборочный критерий Стьюдента

# Cреднее для каждой из выборок
mean_tension1 = mean(tension1)
mean_tension1 # 2,61875
mean_tension2 = mean(tension2)
mean_tension2 # 3,666

# Дисперсия
dispersion = (sum((tension1 - mean_tension1)**2) + sum((tension2 - mean_tension2)**2))/(length(tension1) + length(tension2) - 2)
dispersion # 1,082541

# Рассчитаем t-статистику
t_stat = (mean_tension2 - mean_tension1)/(((dispersion**2)/length(tension1) + (dispersion**2)/length(tension2))**0.5)
t_stat # 3,195

df = (length(tension1) + length(tension2) - 2) 
df # 42 - степень свободы

t_table = 2.018
t_stat > t_table # true

t_stat_s = t.test(tension2, tension1, alternative = "two.sided", var.equal = FALSE)
t_stat_s # t = 3,2825 p = 0.00221
t_stat_s$statistic > t_table # true

# Способ 2: # F-test (критерий Фишера)

# Дисперсия для каждой из выборок
dispersion_tension1 = (sum((tension1 - mean_tension1)**2))/(length(tension1) - 1)
dispersion_tension1 # 0,9469766
dispersion_tension2 = (sum((tension2 - mean_tension2)**2))/(length(tension2) - 1) 
dispersion_tension2 # 1,246646

# F-статистика
F_stat = dispersion_tension1/dispersion_tension2
F_stat # 0,7596193
F_stat_s = var.test(tension1,tension2)
F_stat_s # 0,75962

F_table = 2.123
F_stat < F_table # true
F_stat_s$statistic < F_table # true

F_stat_s$p.value # 0,5251689 

# Cпособ 3: # Критерий Уилкоксона W

data$rank = rank(data$tension) # ранги значений объединенной выборки (из двух изначальных)
#data$rank
rank_sum1 = sum(data$rank[data$group == "factory2"])
rank_sum1 # 570 - W

rank_sum1 > 559 # true
rank_sum1 > 534 # true
rank_sum1 > 521 # true
