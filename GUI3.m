function varargout = GUI3(varargin)
% GUI3 MATLAB code for GUI3.fig
%      GUI3, by itself, creates a new GUI3 or raises the existing
%      singleton*.
%
%      H = GUI3 returns the handle to a new GUI3 or the handle to
%      the existing singleton*.
%
%      GUI3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI3.M with the given input arguments.
%
%      GUI3('Property','Value',...) creates a new GUI3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI3

% Last Modified by GUIDE v2.5 06-Dec-2017 01:15:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI3_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI3_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUI3 is made visible.
function GUI3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI3 (see VARARGIN)

for i = 1:40
    dir = ['att_faces/s',num2str(i),'/10.pgm'];
    myImage = imread(dir);
    img_list(:,:,i) = myImage;
end

axes(handles.axes1)
imshow(img_list(:,:,1));

axes(handles.axes2)
imshow(img_list(:,:,2));

axes(handles.axes3)
imshow(img_list(:,:,3));

axes(handles.axes4)
imshow(img_list(:,:,4));

axes(handles.axes5)
imshow(img_list(:,:,5));

axes(handles.axes6)
imshow(img_list(:,:,6));

axes(handles.axes7)
imshow(img_list(:,:,7));

axes(handles.axes8)
imshow(img_list(:,:,8));

axes(handles.axes9)
imshow(img_list(:,:,9));

axes(handles.axes10)
imshow(img_list(:,:,10));

axes(handles.axes11)
imshow(img_list(:,:,11));

axes(handles.axes12)
imshow(img_list(:,:,12));

axes(handles.axes13)
imshow(img_list(:,:,13));

axes(handles.axes14)
imshow(img_list(:,:,14));

axes(handles.axes15)
imshow(img_list(:,:,15));

axes(handles.axes16)
imshow(img_list(:,:,16));

axes(handles.axes17)
imshow(img_list(:,:,17));

axes(handles.axes18)
imshow(img_list(:,:,18));

axes(handles.axes19)
imshow(img_list(:,:,19));

axes(handles.axes20)
imshow(img_list(:,:,20));

axes(handles.axes21)
imshow(img_list(:,:,21));

axes(handles.axes22)
imshow(img_list(:,:,22));

axes(handles.axes23)
imshow(img_list(:,:,23));

axes(handles.axes24)
imshow(img_list(:,:,24));

axes(handles.axes25)
imshow(img_list(:,:,25));

axes(handles.axes26)
imshow(img_list(:,:,26));

axes(handles.axes27)
imshow(img_list(:,:,27));

axes(handles.axes28)
imshow(img_list(:,:,28));

axes(handles.axes29)
imshow(img_list(:,:,29));

axes(handles.axes30)
imshow(img_list(:,:,30));

axes(handles.axes31)
imshow(img_list(:,:,31));

axes(handles.axes32)
imshow(img_list(:,:,32));

axes(handles.axes33)
imshow(img_list(:,:,33));

axes(handles.axes34)
imshow(img_list(:,:,34));

axes(handles.axes35)
imshow(img_list(:,:,35));

axes(handles.axes36)
imshow(img_list(:,:,36));

axes(handles.axes37)
imshow(img_list(:,:,37));

axes(handles.axes38)
imshow(img_list(:,:,38));

axes(handles.axes39)
imshow(img_list(:,:,39));

axes(handles.axes40)
imshow(img_list(:,:,40));

% Choose default command line output for GUI3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI3 wait for user response (see UIRESUME)
uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% Get default command line output from handles structure
% varargout{1} = handles.output;
varargout{1} = get(handles.popupmenu2,'value');
delete(handles.figure1);





% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function figure1_CloseRequestFcn(hObject, eventdata, handles)
if isequal(get(hObject, 'waitstatus'), 'waiting')
% The GUI is still in UIWAIT, us UIRESUME
uiresume(hObject);
else
% The GUI is no longer waiting, just close it
delete(hObject);
end
