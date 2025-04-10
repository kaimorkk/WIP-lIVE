table 55927 "Document E-Mail Log"
{
    Permissions = TableData "G/L Entry" = rimd;
    Caption = 'Document E-Mail Log';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No"; Integer)
        {
        }
        field(2; "Account Type"; Option)
        {
            OptionCaption = 'Customer,Vendor';
            OptionMembers = Customer,Vendor;
        }
        field(3; "Account No."; Code[20])
        {
        }
        field(4; Document; Blob)
        {
        }
        field(5; "E-mailed To"; Text[80])
        {
            Editable = false;
        }
        field(6; DateTime; DateTime)
        {
        }
        field(7; "Document Type"; Option)
        {
            OptionCaption = 'Sales Invoice,Service Invoice,Customer Statement,Remittance Advice,Payslips,P9,Payment Receipts,EFT Remittance Advice,Reminder';
            OptionMembers = "Sales Invoice","Service Invoice","Customer Statement","Remittance Advice",Payslips,P9,"Payment Receipts","EFT Remittance Advice",Reminder;
        }
        field(8; "File Extension"; Text[250])
        {
            Caption = 'File Extension';
        }
        field(9; "Document No"; Code[20])
        {
        }
        field(10; Send; Boolean)
        {
        }
        field(11; "E-Mailed"; Boolean)
        {
        }
        field(12; "E-Mailed By"; Code[50])
        {
        }
        field(13; "E-Mail DateTime"; DateTime)
        {
        }
        field(50050; "User ID"; Code[50])
        {
            TableRelation = "User Setup"."User ID";
        }
    }

    keys
    {
        key(Key1; "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    // var
    //     TableCodeTransfer: Codeunit "Table Code Transferred-Layer";

    // procedure ExportAttachment(ExportToFile: Text[260]): Boolean
    // begin
    //     exit(TableCodeTransfer.DocEmailLogExportAttachment(Rec, ExportToFile));
    // end;

    // procedure DeleteFile(FileName: Text[260]): Boolean
    // begin
    //     exit(TableCodeTransfer.DocEmailLogDeleteFile(FileName));
    // end;

    // procedure ConstFilename() FileName: Text[260]
    // begin
    //     exit(TableCodeTransfer.DocEmailLogConstFilename);
    // end;

    // procedure OpenFile(WindowTitle: Text[50]; DefaultFileName: Text[250]; DefaultFileType: Option " ",Text,Excel,Word,Custom; FilterString: Text[250]; "Action": Option Open,Save): Text[260]
    // begin
    //     //exit(TableCodeTransfer.DocEmailLogOpenFile(WindowTitle, DefaultFileName, DefaultFileType, FilterString, Action));
    // end;
}

