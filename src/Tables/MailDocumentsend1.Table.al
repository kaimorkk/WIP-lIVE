Table 52193707 "Mail/Document send1"
{
    DrillDownPageID = "Mail/Document Move List";
    LookupPageID = "Mail/Document Move List";

    fields
    {
        field(1;"Movement Code";Code[20])
        {
        }
        field(2;"Receiver Type";Option)
        {
            OptionCaption = ',Employee,Vendor,Customer';
            OptionMembers = ,Employee,Vendor,Customer;
        }
        field(3;Document;Code[10])
        {
            TableRelation = "Document Management1";

            trigger OnValidate()
            begin
                if Doc.Get(Document,File,Volume) then
                "Document Description":=Doc.Description
                else
                "Document Description":='';
            end;
        }
        field(4;Mail;Code[20])
        {
            TableRelation = Mails1;

            trigger OnValidate()
            begin
                if Mails.Get(Mail) then
                "Mail Description":=Mails.Description
                else
                Mails.Description:='';
            end;
        }
        field(5;"Document Description";Text[200])
        {
        }
        field(6;"Mail Description";Text[200])
        {
        }
        field(8;"No. Series";Code[20])
        {
        }
        field(9;Date;Date)
        {
        }
        field(10;Time;Time)
        {
        }
        field(11;"Employee No.";Code[10])
        {
            Editable = true;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                 if Employees.Get("Employee No.") then
                 "Employee Name":=Employees."First Name"+' '+Employees."Last Name"
                 else
                "Employee Name":='';
            end;
        }
        field(12;"Employee Name";Text[100])
        {
        }
        field(13;"Vendor No";Code[10])
        {
            Editable = true;
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                 if Vend.Get("Vendor No") then
                 "Vendor Name":=Vend.Name
                 else
                "Vendor Name":='';
            end;
        }
        field(14;"Vendor Name";Text[100])
        {
        }
        field(15;"Customer No";Code[10])
        {
            Editable = true;
            TableRelation = Customer;

            trigger OnValidate()
            begin
                 if Cust.Get("Customer No") then
                 "Customer Name":=Cust.Name
                 else
                Cust.Name:='';
            end;
        }
        field(16;"Customer Name";Text[100])
        {
        }
        field(17;File;Code[20])
        {
        }
        field(18;Volume;Code[10])
        {
        }
        field(19;Issuer;Code[10])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if Employees.Get(Issuer) then
                 "Issuer Name":=Employees."First Name"+' '+Employees."Last Name"
                 else
                "Issuer Name":='';
            end;
        }
        field(20;"Issuer Name";Text[100])
        {
        }
        field(21;"Issued?";Boolean)
        {
        }
        field(22;Receiver;Code[10])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if Employees.Get(Receiver) then
                 "Receiver Name":=Employees."First Name"+' '+Employees."Last Name"
                 else
                "Receiver Name":='';
            end;
        }
        field(23;"Receiver Name";Text[100])
        {
        }
        field(24;"Receiving Date";Date)
        {
        }
        field(25;"Receiving Time";Time)
        {
        }
        field(26;"Received?";Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Movement Code",Mail,Document,File,Volume)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Movement Code" = '' then begin
          SalesSetup.Get;
          SalesSetup.TestField(MailMove);
          NoSeriesMgt.InitSeries(SalesSetup.MailMove,xRec."Movement Code",0D,"Movement Code","No. Series");
        end;
    end;

    var
        Mails: Record Mails1;
        Doc: Record "Document Management1";
        Employees: Record Employee;
        SalesSetup: Record "Resource Centre Setup1";
        CommentLine: Record "Comment Line";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Vend: Record Vendor;
        Cust: Record Customer;
}

