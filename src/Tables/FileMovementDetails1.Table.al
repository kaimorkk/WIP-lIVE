Table 52193710 "File Movement Details1"
{
    DrillDownPageID = "Specially Permitted Procuremen";
    LookupPageID = "Specially Permitted Procuremen";

    fields
    {
        field(1;"File Movement Code";Code[20])
        {

            trigger OnValidate()
            begin
                if "File Movement Code" <> xRec."File Movement Code" then begin
                  SalesSetup.Get;
                  NoSeriesMgt.TestManual(SalesSetup."File Movement Numbers");
                  "No. Series" := '';
                end;
            end;
        }
        field(2;"File Issue date";Date)
        {
        }
        field(3;"File Issue Time";Time)
        {
        }
        field(4;"Date Due at Registry";Date)
        {
        }
        field(5;"Officer issued file";Code[20])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                emp.Get("Officer issued file");
                "Officer Name":=emp."Last Name"+' '+emp."First Name";
            end;
        }
        field(6;"File Code";Code[20])
        {
            TableRelation = "File Details1";
        }
        field(7;"No. Series";Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(8;"Action Taken";Text[100])
        {
        }
        field(10;"Date Returned To Registry";Date)
        {
        }
        field(11;"Receiving Officer";Code[20])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                emp.Get("Receiving Officer");
                "Receiver Name":=emp."Last Name"+' '+emp."First Name";
                Modify;
            end;
        }
        field(12;"Folio No.";Code[10])
        {
            TableRelation = "Document Management1";
        }
        field(13;"Global Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");
            end;
        }
        field(14;"Global Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Global Dimension 2 Code");
            end;
        }
        field(15;Moved;Boolean)
        {
        }
        field(16;"Registry Comments";Text[250])
        {
        }
        field(17;"Officer Name";Text[80])
        {
        }
        field(18;"File Name";Text[100])
        {
        }
        field(19;"Folio Name";Text[100])
        {
        }
        field(20;"Department Name";Text[100])
        {
        }
        field(21;"Receiver Name";Text[100])
        {
        }
        field(22;"Issued?";Boolean)
        {
        }
        field(23;"Returned?";Boolean)
        {
        }
        field(24;"Request No";Code[20])
        {
            TableRelation = "File Requests1";
        }
        field(25;Volume;Code[10])
        {
            TableRelation = "File Details1".Volume;
        }
        field(26;Transfered;Boolean)
        {
        }
        field(27;"Prevoius Holder";Code[10])
        {
        }
    }

    keys
    {
        key(Key1;"File Movement Code","File Code","Request No",Volume)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "File Movement Code" = '' then begin
          SalesSetup.Get;
          SalesSetup.TestField("File Movement Numbers");
          NoSeriesMgt.InitSeries(SalesSetup."File Movement Numbers",xRec."File Movement Code",0D,"File Movement Code","No. Series");
        end;
    end;

    var
        SalesSetup: Record "Resource Centre Setup1";
        CommentLine: Record "Comment Line";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        DimMgt: Codeunit DimensionManagement;
        GLSetup: Record "General Ledger Setup";
        emp: Record Employee;
        files: Record "File Details1";


    procedure ValidateShortcutDimCode(FieldNumber: Integer;var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNumber,ShortcutDimCode);
        //DimMgt.SaveDefaultDim(Database::Table51015,"File Movement Code",FieldNumber,ShortcutDimCode);
        Modify;
    end;
}

