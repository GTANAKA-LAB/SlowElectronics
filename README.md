# SlowElectronics samples (currently shared only with CREST members)

RC-based implementations for time series processing tasks in slow electronics.

| Data | Task | Repository/URL | Model(Algorithm) | Reference | 
| ------------- | ------------- | ------------- | ------------ | ----------- |
| Handwriting Triangles (2 persons)| Anomaly detection (for Authentication) | [Folder](https://github.com/GTANAKA-LAB/SlowElectronics/tree/main/HandwrittenTriangles_SNNreservoir) | (1)SNN-reservoir(FORCE[^2])| [Inoue et al., IEEE Symposium on VLSI Technology and Circuits, 2023](https://ieeexplore.ieee.org/document/10185412) |
| Handwriting Triangles (2 persons)| Anomaly detection (for Authentication) | [Folder](https://github.com/GTANAKA-LAB/SlowElectronics/tree/main/HandwrittenTriangles_ESNvsLSTM)| (1)ESN[^1](LR[^3]) <br>(2)LSTM[^4](BPTT[^5]) | --- |
| [Human Blood Pressure](https://www.nature.com/articles/s41597-022-01202-y) | Classification (for Authentication) | [Repository](https://github.com/Ziqiang-IRCN/ESN-Continuous-blood-pressure-data.git)| (1)ESN[^1](LR[^3]) <br>(2)Bidirectional-ESN(LR[^3]) | [Li et al., ICANN, 2023](https://link.springer.com/chapter/10.1007/978-3-031-44216-2_2) | 
| [UCR Anomaly Archive](https://wu.renjie.im/research/anomaly-benchmarks-are-flawed/) <br>(A collection of 250 univariate time series collected in human medicine, biology, meteorology and industry) | Anomaly detection | [Repository](https://github.com/hiroto0324/MD-RS) | (1)ESN[^1](LR[^3]) <br>(2)MDRS[^6](RLS[^7]) | [Tamura et al., TechRxiv](https://www.techrxiv.org/articles/preprint/Mahalanobis_Distance_of_Reservoir_States_for_Online_Time-Series_Anomaly_Detection/22678774) | 
| Characteristic Trajectory,... | Classification | Repository/URL (Tamura-san?) | (1)ESN(LR) <br>(2)ESN(SVM) <br>(3)MDRS(RLS[^7]) | --- | 
| Blood Glucose ? | Prediction | Repository/URL (Yajima-san?) | (1)ESN(FORCE)? | --- |


[^1]: Echo State Network (Jaeger, 2001) [paper pdf](https://www.ai.rug.nl/minds/uploads/EchoStatesTechRep.pdf)  
[^2]: FORCE learning ([Sussillo and Abbott, 2009](https://www.sciencedirect.com/science/article/pii/S0896627309005479?via%3Dihub))    
[^3]: Linear Regression
[^4]: Long Short-Term Memory ([Hochreiter and Schmidhuber, 1997](https://direct.mit.edu/neco/article-abstract/9/8/1735/6109/Long-Short-Term-Memory?redirectedFrom=fulltext))
[^5]: Backpropagation Through Time ([Werbos et al., 1990](https://ieeexplore.ieee.org/document/58337))  
[^6]: Mahalanobis Distance of Reservoir States ([Tamura et al., 2023](https://www.techrxiv.org/users/690366/articles/681614-mahalanobis-distance-of-reservoir-states-for-online-time-series-anomaly-detection))  
[^7]: Recursive Least Square ([Jaeger, 2003](https://papers.nips.cc/paper_files/paper/2002/hash/426f990b332ef8193a61cc90516c1245-Abstract.html))  
