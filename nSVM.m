%% support vector machine (SVM) models using the one-versus-one 
t = templateSVM('Standardize',1,'KernelFunction','linear');
Md3 = fitcecoc(data_real,output','Learners',t);
label3_1 = predict(Md3,data_test1);
label3_2 = predict(Md3,data_test2);
label3_3 = predict(Md3,data_test3);
label3_4 = predict(Md3,data_test4);
Accuracy3_1=mean(output'==label3_1)*100;
Accuracy3_2=mean(output'==label3_2)*100;
Accuracy3_3=mean(output'==label3_3)*100;
Accuracy3_4=mean(output'==label3_4)*100;
Accuracy3=(90*Accuracy3_1+6*Accuracy3_2+3*Accuracy3_3+Accuracy3_4)/100;

EVAL3_1 = Evaluate(output,label3_1');
EVAL3_2 = Evaluate(output,label3_2');
EVAL3_3 = Evaluate(output,label3_3');
EVAL3_4 = Evaluate(output,label3_4');
EVAL3=[90.*EVAL3_1;6.*EVAL3_2;3.*EVAL3_3;EVAL3_4];
MeanEval3=mean(EVAL3)/25