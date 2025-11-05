clc; clear;

load('labday4/IMU_data_flying');
IMU_flying = IMU_data;

load('labday4/IMU_data_still');
IMU_still = IMU_data;

cov(IMU_still)
R_d = cov(IMU_flying)


