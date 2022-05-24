function varargout = vigenere(varargin)
% VIGENERE MATLAB code for vigenere.fig
%      VIGENERE, by itself, creates a new VIGENERE or raises the existing
%      singleton*.
%
%      H = VIGENERE returns the handle to a new VIGENERE or the handle to
%      the existing singleton*.
%
%      VIGENERE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VIGENERE.M with the given input arguments.
%
%      VIGENERE('Property','Value',...) creates a new VIGENERE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before vigenere_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to vigenere_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help vigenere

% Last Modified by GUIDE v2.5 23-May-2022 22:26:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @vigenere_OpeningFcn, ...
                   'gui_OutputFcn',  @vigenere_OutputFcn, ...
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


% --- Executes just before vigenere is made visible.
function vigenere_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to vigenere (see VARARGIN)

% Choose default command line output for vigenere
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes vigenere wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = vigenere_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in decode_btn.
function decode_btn_Callback(hObject, eventdata, handles)
% hObject    handle to decode_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cipher_text=lower(get(handles.encoded_text,'string'));
key=get(handles.keyword,'string');
plaintext = Dec_vigenere(cipher_text,key);
upper_pla=upper(plaintext);
set(handles.decoded_text,'string',upper_pla);

% --- Executes on button press in encode_btn.
function encode_btn_Callback(hObject, eventdata, handles)
% hObject    handle to encode_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
text=get(handles.text,'string');
key=get(handles.keyword,'string');
ciphertext = Enc_vigenere(text,key);
set(handles.encoded_text,'string',ciphertext)

function text_Callback(hObject, eventdata, handles)
% hObject    handle to text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text as text
%        str2double(get(hObject,'String')) returns contents of text as a double


% --- Executes during object creation, after setting all properties.
function text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function keyword_Callback(hObject, eventdata, handles)
% hObject    handle to keyword (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of keyword as text
%        str2double(get(hObject,'String')) returns contents of keyword as a double


% --- Executes during object creation, after setting all properties.
function keyword_CreateFcn(hObject, eventdata, handles)
% hObject    handle to keyword (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function decoded_text_Callback(hObject, eventdata, handles)
% hObject    handle to decoded_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of decoded_text as text
%        str2double(get(hObject,'String')) returns contents of decoded_text as a double


% --- Executes during object creation, after setting all properties.
function decoded_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to decoded_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function encoded_text_Callback(hObject, eventdata, handles)
% hObject    handle to encoded_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of encoded_text as text
%        str2double(get(hObject,'String')) returns contents of encoded_text as a double


% --- Executes during object creation, after setting all properties.
function encoded_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to encoded_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
    


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text,'string','');
set(handles.keyword,'string','');
set(handles.decoded_text,'string','');
set(handles.encoded_text,'string','');
