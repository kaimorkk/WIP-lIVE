
table 69060 "Hr Welfare Header"
{

    fields
    {
        field(1; "Welfare No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Welfare Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Application,Contribution,Benefit;
        }
        field(3; "Raised By"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange("No.", "Raised By");
                if Employee.FindSet then begin
                    "Raisee Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                    "Global Dimension 1 Code" := Employee."Global Dimension 1 Code";
                    "Global Dimension 2 Code" := Employee."Global Dimension 2 Code";
                end
            end;
        }
        field(4; "Raisee Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Welfare Category"; Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; "Created By"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; "Created On"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; Status; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionMembers = Open,"Pending Approval",Released,Closed;
        }
        field(10; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(11; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(12; "Global Dimension 1"; Text[30])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Global Dimension 1 Code")));
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            FieldClass = FlowField;
        }
        field(13; "Global Dimension 2"; Text[30])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Global Dimension 2 Code")));
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            FieldClass = FlowField;
        }
        field(14; "No Series"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Total Amount"; Decimal)
        {
            CalcFormula = sum("Welfare Lines".Amount where("Welfare Header No." = field("Welfare No.")));
            FieldClass = FlowField;
        }
        field(16; "Benefit Allocation"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17; "Welfare Code"; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Benefits Matrix Setup"."Line No.";

            trigger OnValidate()
            begin
                BenefitsMatrixSetup.Reset;
                BenefitsMatrixSetup.SetRange("Line No.", "Welfare Code");
                if BenefitsMatrixSetup.FindFirst then begin
                    "Welfare Description" := BenefitsMatrixSetup."Benefit Description";
                    "Welfare Category" := Format(BenefitsMatrixSetup."Beneficiary Category");
                    "Benefit Allocation" := BenefitsMatrixSetup.Amount;
                end
            end;
        }
        field(18; "Welfare Description"; Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Welfare No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        //GENERATE DOCUMENT NUMBER
        if "Welfare Type" = "welfare type"::Benefit then begin
            if "Welfare No." = '' then begin
                HRSetup.Get;
                HRSetup.TestField(HRSetup."Legal Case Nos");
                NoSeriesMgt.InitSeries(HRSetup."Legal Case Nos", xRec."No Series", 0D, "Welfare No.", "No Series");
            end;
        end;
        if "Welfare Type" = "welfare type"::Application then begin
            if "Welfare No." = '' then begin
                HRSetup.Get;
                HRSetup.TestField(HRSetup."Legal Case Nos");
                NoSeriesMgt.InitSeries(HRSetup."Legal Case Nos", xRec."No Series", 0D, "Welfare No.", "No Series");
            end;
        end;
        if "Welfare Type" = "welfare type"::Contribution then begin
            if "Welfare No." = '' then begin
                HRSetup.Get;
                HRSetup.TestField(HRSetup."Legal Case Nos");
                NoSeriesMgt.InitSeries(HRSetup."Legal Case Nos", xRec."No Series", 0D, "Welfare No.", "No Series");
            end;
        end;
        /*ELSE BEGIN
          IF "Welfare Category"="Welfare Category"::"1" THEN BEGIN
            IF "Welfare No." = '' THEN BEGIN
          HRSetup.GET;
          HRSetup.TESTFIELD(HRSetup."Matanga Nos.");
          NoSeriesMgt.InitSeries(HRSetup."Matanga Nos.",xRec."No Series",0D,"Welfare No.","No Series");
        END;
          END  ELSE IF
            "Welfare Category"="Welfare Category"::"2" THEN BEGIN
              IF "Welfare No." = '' THEN BEGIN
          HRSetup.GET;
          HRSetup.TESTFIELD(HRSetup."Wedding Nos.");
          NoSeriesMgt.InitSeries(HRSetup."Wedding Nos.",xRec."No Series",0D,"Welfare No.","No Series");
        END;
            END;
              END;*/
        "Created By" := UserId;
        "Created On" := CurrentDatetime;

    end;

    var
        Employee: Record Employee;
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        BenefitsMatrixSetup: Record "Benefits Matrix Setup";
}

