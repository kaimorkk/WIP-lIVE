Table 52194021 "Employee Training Needs1"
{
    DrillDownPageID = "Training Needs HOD";
    LookupPageID = "Training Needs HOD";

    fields
    {
        field(1;"Code";Code[20])
        {
            NotBlank = true;
        }
        field(2;Description;Text[250])
        {
        }
        field(3;"Start Date";Date)
        {
        }
        field(4;"End Date";Date)
        {
        }
        field(5;"Duration Units";Option)
        {
            OptionMembers = Hours,Days,Weeks,Months,Years;
        }
        field(6;Duration;Decimal)
        {
        }
        field(7;"Cost Of Training";Decimal)
        {

            trigger OnValidate()
            begin
                if Posted then begin
                if Duration <> xRec.Duration then begin
                Message('%1','You cannot change the costs after posting');
                Duration := xRec.Duration;
                end
                end
            end;
        }
        field(8;Location;Text[100])
        {
        }
        field(9;Qualification;Code[30])
        {
            NotBlank = true;
            TableRelation = Qualification.Code;
        }
        field(10;"Re-Assessment Date";Date)
        {
        }
        field(11;Source;Code[50])
        {
            NotBlank = true;
            TableRelation = "Training Source1".Source;
        }
        field(12;"Need Source";Option)
        {
            OptionCaption = ' ,Succesion,Training,Employee,Employee Skill Plan';
            OptionMembers = " ",Succesion,Training,Employee,"Employee Skill Plan";

            trigger OnValidate()
            begin
                 /*
                 TrainingNeed:='';
                
                IF "Need Source"="Need Source"::Succesion THEN
                // BEGIN
                 DevelopmentNeed.RESET;
                 DevelopmentNeed.SETRANGE(DevelopmentNeed."Employee No.","Employee No");
                 DevelopmentNeed.SETRANGE(DevelopmentNeed."Appraisal Period","Appraisal Period");
                 IF DevelopmentNeed.FIND('-') THEN
                 { REPEAT
                  TrainingNeed:=TrainingNeed+DevelopmentNeed."Development Need";
                 UNTIL DevelopmentNeed.NEXT=0;
                  Description:=TrainingNeed;
                 END ELSE
                  }
                
                  MESSAGE('development need=%1',DevelopmentNeed."Development Need");
                
                   Description:=DevelopmentNeed."Development Need";
                  */

            end;
        }
        field(13;Provider;Code[20])
        {
            TableRelation = Vendor."No.";
        }
        field(14;Post;Boolean)
        {
        }
        field(15;Posted;Boolean)
        {
            Editable = true;
        }
        field(16;"Department Code";Code[20])
        {
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));

            trigger OnLookup()
            begin

                DimensionValue.Reset;
                if DimensionValue.Get('DEPARTMENT',"Department Code") then
                  "Department Name":=DimensionValue.Name;
            end;
        }
        field(17;"Employee No";Code[20])
        {
            TableRelation = Employee where ("Global Dimension 1 Code"=field("Department Code"));

            trigger OnValidate()
            begin
                Employee.Reset;
                if Employee.Get("Employee No") then
                 "Employee Name":=Employee."First Name"+' '+Employee."Middle Name"+' '+Employee."Last Name";
            end;
        }
        field(18;"Employee Name";Text[50])
        {
        }
        field(19;"Appraisal Period";Code[20])
        {
        }
        field(20;"Proposed Training";Text[250])
        {
        }
        field(21;Directorate;Code[20])
        {
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));

            trigger OnValidate()
            begin

                DimensionValue.Reset;
                if DimensionValue.Get('DIRECTORATE',"Department Code") then
                  "Directorate Name":=DimensionValue.Name;
            end;
        }
        field(22;Status;Option)
        {
            OptionCaption = 'Open,Released,Pending Approval,Pending Prepayment,Rejected';
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment",Rejected;
        }
        field(23;"Duration(Needs to be satiated)";Date)
        {
        }
        field(24;"No. Series";Code[10])
        {
            TableRelation = "No. Series";
        }
        field(25;"Directorate Name";Text[50])
        {
        }
        field(26;"Department Name";Text[50])
        {
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Employee: Record Employee;
        OK: Boolean;
        AppraisalLines: Record "Appraisal Lines1";
        TrainingNeed: Text[250];
        DevelopmentNeed: Record "Appraisal Development Needs";
        HumanResSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        DimensionValue: Record "Dimension Value";
}

