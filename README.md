# SlowElectronics

## Concept
SlowElectronics indicate electronic technology suited for efficiently processing slowly varying signals (i.e. signals with relatively large timesacles). Such signals are typically found in biological phenomena and human activities. Current electronics seeking highly speedy signal processing often encounter a difficulty in efficiently handling slowly varying signals. We are going to develop SlowElectronics towards realization of extremely efficient neuromorphic hardware devices by integrating methodologies in material science, electrical engineering, information science, and neuroscience. This concept was proposed in the JST CREST Project ([Platform for real-time learning at the edge with spiking neural networks](https://sites.google.com/view/crest-snn/), 2019-2024, Grant No. JPMJCR19K2) directed by [Dr. Isao H. Inoue at AIST](https://sites.google.com/view/isao/).

## Slow signals
Examples of target signals of SlowElectronics are shown below.
<br>
![timescale](https://github.com/user-attachments/assets/b6de4654-0509-49a0-b2e7-642ee8cb838c)

## Reservoir computing for SlowElectronics
Reservoir computing is one of the machine learning frameworks promising for SlowElectronics. We have demonstrated that reservoir computing systems are suited for dealing with slowly varying time series data in individual studies. This site collects the information on the program codes developed in these studies. 


| Data | Task | Repository/URL | Model(Algorithm) | Reference | 
| ------------- | ------------- | ------------- | ------------ | ----------- |
| Handwriting Triangles <br>(two persons)| Anomaly detection <br>(for Authentication) | [Folder](https://github.com/GTANAKA-LAB/SlowElectronics/tree/main/HandwrittenTriangles_SNNreservoir) | (1) SNN-reservoir (FORCE[^FORCE])| [Inoue et al., IEEE Symposium on VLSI Technology and Circuits, 2023](https://ieeexplore.ieee.org/document/10185412) |
| Handwriting Triangles <br>(two persons)| Anomaly detection <br>(for Authentication) | [Folder](https://github.com/GTANAKA-LAB/SlowElectronics/tree/main/HandwrittenTriangles_ESNvsLSTM)| (1) ESN[^ESN] (LR[^LR]) <br>(2) LSTM[^LSTM] (BPTT[^BPTT]) | --- |
| [Human Blood Pressure](https://www.nature.com/articles/s41597-022-01202-y) | Classification <br>(for Authentication) | [Repository](https://github.com/Ziqiang-IRCN/ESN-Continuous-blood-pressure-data.git)| (1) ESN[^ESN] (LR[^LR]) <br>(2) Bidirectional-ESN (LR[^LR]) | [Li et al., ICANN, 2023](https://link.springer.com/chapter/10.1007/978-3-031-44216-2_2) | 
| [UCR Anomaly Archive](https://wu.renjie.im/research/anomaly-benchmarks-are-flawed/) <br>(A collection of 250 univariate time series collected in human medicine, biology, meteorology and industry) | Anomaly detection | [Repository](https://github.com/hiroto0324/MD-RS) | (1) ESN[^ESN] (LR[^LR]) <br>(2) MDRS[^MDRS] (RLS[^RLS]) | [Tamura et al., TechRxiv, 2023](https://www.techrxiv.org/articles/preprint/Mahalanobis_Distance_of_Reservoir_States_for_Online_Time-Series_Anomaly_Detection/22678774) |  
| [Human Blood Glucose](https://public.jaeb.org/datasets/diabetes) <br>(A Study to Assess Continuous Glucose Sensor Profiles in Healthy Non-Diabetic Participants Aged <7 Years) | Prediction | [Repository](https://github.com/lazymuseums/ESN_Glucose) | (1)ESN[^ESN] (RLS[^RLS]) | [Pati et al., Commun. Mater. 2024](https://www.nature.com/articles/s43246-024-00621-1) |


[^ESN]: Echo State Network (Jaeger, 2001) [paper pdf](https://www.ai.rug.nl/minds/uploads/EchoStatesTechRep.pdf)
[^LR]: Linear/Ridge Regression
[^RLS]: Recursive Least Square ([Jaeger, 2003](https://papers.nips.cc/paper_files/paper/2002/hash/426f990b332ef8193a61cc90516c1245-Abstract.html))  
[^FORCE]: FORCE learning ([Sussillo and Abbott, 2009](https://www.sciencedirect.com/science/article/pii/S0896627309005479?via%3Dihub))
[^MDRS]: Mahalanobis Distance of Reservoir States ([Tamura et al., 2023](https://www.techrxiv.org/users/690366/articles/681614-mahalanobis-distance-of-reservoir-states-for-online-time-series-anomaly-detection))  
[^LSTM]: Long Short-Term Memory ([Hochreiter and Schmidhuber, 1997](https://direct.mit.edu/neco/article-abstract/9/8/1735/6109/Long-Short-Term-Memory?redirectedFrom=fulltext))
[^BPTT]: Backpropagation Through Time ([Werbos et al., 1990](https://ieeexplore.ieee.org/document/58337))  
