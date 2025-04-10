table 50918 Attachments
{
    Caption = 'Attachmentss';
    DataClassification = CustomerContent;
    fields
    {
        field(1; LineNo; Integer)
        {
            AutoIncrement = true;
        }
        field(2; Document_No; Text[50])
        {
            Caption = 'Document_No';
        }
        field(3; Link; Text[250])
        {
            ExtendedDatatype = URL;
            Caption = 'Link';
        }
        field(4; Module; Text[100])
        {
            Caption = 'Module';
        }
        field(5; FileType; Text[50])
        {
            Caption = 'FileType';
        }
        field(6; User; Text[100])
        {
            Caption = 'User';
        }
        field(7; FileName; Text[250])
        {
            Caption = 'FileName';
        }
        field(8; DocumentID; Text[100])
        {
            Caption = 'DocumentID';
        }
        field(9; Order_No; Text[50])
        {
            Caption = 'Order_No';
        }
        field(10; "File Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = General,Confidential;
        }

        field(11; "Table Id"; Text[20])
        {
            Caption = 'Table Id';
        }
        field(12; "LPO Type"; Text[50])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "LPO Attachment Type"."File Name";
        }
        field(13; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; LineNo)
        {
            Clustered = true;
        }
        key(Key2; "Document_No")
        {

        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        Attachment.Reset();
        if Attachment.FindLast() then
            LineNo := Attachment.LineNo + 1
        else
            LineNo := 1
    end;

    var
        Attachment: Record Attachments;
}
