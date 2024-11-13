# SlowElectronics samples (currently shared only with CREST members)

RC-based implementations for time series processing tasks in slow electronics.

| Data | Task | Repository/URL | Model(Algorithm) | Reference | 
| ------------- | ------------- | ------------- | ------------ | ----------- |
| Handwriting Triangles (2 persons)| Anomaly detection (for Authentication) | [Folder](https://github.com/GTANAKA-LAB/SlowElectronics/tree/main/HandwrittenTriangles_SNNreservoir) | (1)SNN-reservoir(FORCE)| [Inoue et al., IEEE Symposium on VLSI Technology and Circuits, 2023](https://ieeexplore.ieee.org/document/10185412) |
| Handwriting Triangles (2 persons)| Anomaly detection (for Authentication) | [Folder](https://github.com/GTANAKA-LAB/SlowElectronics/tree/main/HandwrittenTriangles_ESNvsLSTM) (Tanaka)| (1)ESN(LR) <br>(2)LSTM(BPTT) | --- |
| [Human Blood Pressure](https://www.nature.com/articles/s41597-022-01202-y) | Classification (for Authentication) | [Repository](https://github.com/Ziqiang-IRCN/ESN-Continuous-blood-pressure-data.git)| (1)ESN(LR) <br>(2)Bidirectional-ESN(LR) | [Li et al., ICANN, 2023](https://link.springer.com/chapter/10.1007/978-3-031-44216-2_2) | 
| [UCR Anomaly Archive](https://wu.renjie.im/research/anomaly-benchmarks-are-flawed/) <br>(A collection of 250 univariate time series collected in human medicine, biology, meteorology and industry) | Anomaly detection | [Repository](https://github.com/hiroto0324/MD-RS) | (1)ESN(LR) <br>(2)MDRS(P-matrix update) | [Tamura et al., TechRxiv](https://www.techrxiv.org/articles/preprint/Mahalanobis_Distance_of_Reservoir_States_for_Online_Time-Series_Anomaly_Detection/22678774) | 
| Characteristic Trajectory,... | Classification | Repository/URL (Tamura-san?) | (1)ESN(LR) <br>(2)ESN(SVM) <br>(3)MDRS(P-matrix update) | --- | 
| Blood Glucose ? | Prediction | Repository/URL (Yajima-san?) | (1)ESN(FORCE)? | --- |

## ESN: Echo State Network (Jaeger, 2001) [paper pdf](https://www.ai.rug.nl/minds/uploads/EchoStatesTechRep.pdf)
## FORCE: FORCE learning ([Sussillo and Abbott, 2009](https://www.sciencedirect.com/science/article/pii/S0896627309005479?via%3Dihub))  
## LR: Linear Regression
## BPTT: Backpropagation Through Time ([Werbos et al., 1990](https://ieeexplore.ieee.org/document/58337))
