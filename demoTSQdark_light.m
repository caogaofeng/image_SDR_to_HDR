% ���������ؽ��⡱�������͹���ǿ��
% ����ͼ���ԣ���file�޸ĳ�����ͼ���·�������޸��ļ�����׺�����У����ɵõ���ǿ��������������ͼƬͬһ·����
tic;
addpath ours;
file = 'person\Q';%�޸�����ͼƬ��·��
I = imread( [file,'.jpg'] );%�޸�����ͼƬ�ĺ�׺
%RGB�ռ�
name = 'RGB';
J = im2double(I);
fprintf('\n   0 name = RGB\n');
V2 = TooDark(J,0.5,0.38);%ԭͼ���նȱ仯���ع��ʣ��ع�����Ϊ�������ȣ�Խ��Խ����
J = V2;
imwrite(J, [file,'_',name,'_Dark.jpg'] );
%����RGB�е�RGB����
[K,W] = TooLight(I,0.5);
imwrite(K, [file,'_',name,'_Light.jpg'] );
J = J.*W+K.*(1-W);
imwrite(J, [file,'_',name,'_Light_Dark.jpg'] );
fprintf('\n');
subplot 121; imshow(I); title('ԭʼͼ');
subplot 122; imshow(J); title('�����'); 