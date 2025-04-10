TableExtension 52193428 tableextension52193428 extends "Salesperson/Purchaser" 
{
    fields
    {

      field(50000; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,1,3';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Global Dimension 1 Code");
            end;
        }
        field(50001; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,1,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Global Dimension 2 Code");
            end;
        }
        field(50002; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,1,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Global Dimension 2 Code");
            end;
        }
        field(70000; "Department Code"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"),
                                                           "Direct Reports To" = field("Directorate Code"));
        }
        field(70001; "Directorate Code"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(70002; Division; Code[50])
        {
            DataClassification = CustomerContent;
            Enabled = false;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Division/Section"),
                                                           "Direct Reports To" = field("Department Code"));
        }
        field(70003; Region; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Region));
        }
        field(70004; "Role Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ',Sales Person,Procurement Officer';
            OptionMembers = ,"Sales Person","Procurement Officer";
        }
        field(70005; "Employee Status"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = 'Active,Inactive,Terminated';
            OptionMembers = Active,Inactive,Terminated;
        }
        field(70006; Block; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70007; "Employee No"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                Emp.Reset;
                Emp.SetRange("No.", "Employee No");
                if Emp.FindSet then begin
                    //  Emp.CalcFields("Job Title");
                    Name := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
                    "Employee Status" := Emp.Status;
                    rec."Current Position" := Emp."Job Title2";
                    "Directorate Code" := Emp."Directorate Code";
                    "Department Code" := Emp."Department Code";
                    //Region := Emp.Region;
                    "Phone No." := Emp."Phone No.";
                    "E-Mail" := Emp."Company E-Mail";
                    Validate("Global Dimension 1 Code", Emp."Global Dimension 1 Code");
                    Validate("Global Dimension 2 Code", Emp."Global Dimension 2 Code");
                end;
            end;
        }
        field(70008; "User ID"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "User Setup"."User ID";
        }
        field(70009; "Current Position"; Text[100])
        {

        }
        field(700010; "Geographical Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(70011; "Admin Unit Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        Emp: Record Employee;
}
