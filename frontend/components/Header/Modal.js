import React from "react";
import ReactDOM from "react-dom";

const Modal = ({ isOpen, onClose, children }) => {
    if (!isOpen) return null;

    return ReactDOM.createPortal(
        <div className="fixed inset-0 bg-black bg-opacity-50 z-50 flex justify-center items-center">
            <div className="bg-white p-5 rounded shadow-lg max-w-md w-full">
                <button onClick={onClose} className="float-right font-bold">
                    X
                </button>
                {children}
            </div>
        </div>,
        document.body
    );
};

export default Modal;
