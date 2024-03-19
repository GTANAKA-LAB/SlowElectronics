clear('simulation')

trainData=csvread('Trainingdata_A.csv');
testData1=csvread('Testdata_B.csv');
testData2=csvread('Testdata_A.csv');
testDataAll=[testData1;testData2];

% Number of neural elements
N = 260;

hw = HandWrite(N);

tic
hw.evaluate(trainData,testDataAll);
toc

itotal=size(trainData,1)+size(testDataAll,1);

tarr = (1:itotal) * hw.dtstep;

tiledlayout(3,1,'TileSpacing','none','Padding','none');
nexttile
plot(tarr,hw.outlog(:,1),tarr,[trainData(:,1);testDataAll(:,1)]')
ylim([-10 10])
nexttile
plot(tarr,hw.outlog(:,2),tarr,[trainData(:,2);testDataAll(:,2)]')
ylim([-10 10])
nexttile
plot(tarr,hw.rPrlog)
ylim([0,10])
