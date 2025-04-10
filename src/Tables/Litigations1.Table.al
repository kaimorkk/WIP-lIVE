Table 52193717 Litigations1
{
    DrillDownPageID = "Litigation list";
    LookupPageID = "Litigation list";

    fields
    {
        field(1;"Case No.";Code[50])
        {
            NotBlank = true;
        }
        field(2;Description;Text[100])
        {
            NotBlank = true;
        }
        field(3;"Law Firm";Code[20])
        {
            NotBlank = false;
            TableRelation = Vendor where ("Vendor Type"=filter(Law));

            trigger OnValidate()
            begin

                  if vend.Get("Law Firm") then
                  "Law Firm Name":=vend.Name;
            end;
        }
        field(4;"Law Firm Name";Text[100])
        {
        }
        field(5;Schedules;Integer)
        {
            CalcFormula = count("Litigation Schedule1" where ("Litigation Code"=field("Case No.")));
            FieldClass = FlowField;
        }
        field(6;"Employee ID";Code[10])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if Empl.Get("Employee ID") then;
                "Employee name":=Empl."First Name"+' '+Empl."Last Name";
            end;
        }
        field(7;"Employee name";Text[80])
        {
        }
        field(8;"Property ID";Code[10])
        {
            TableRelation = "Fixed Asset" where ("FA Subclass Code"=const('PROPERTY'));

            trigger OnValidate()
            begin
                if  FA.Get("Property ID") then
                "Property Name":=FA.Description
                else
                "Property Name":='';
            end;
        }
        field(9;"Property Name";Text[30])
        {
        }
        field(10;"Property Case";Boolean)
        {
        }
        field(11;"Language Code (Default)";Code[10])
        {
        }
        field(12;Attachement;Option)
        {
            OptionMembers = No,Yes;
        }
        field(13;"File No.";Code[20])
        {
        }
        field(14;"Contact Name";Text[80])
        {
        }
        field(15;Comments;Text[250])
        {
        }
    }

    keys
    {
        key(Key1;"Case No.","Law Firm")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        vend: Record Vendor;
        Empl: Record Employee;
        FA: Record "Fixed Asset";
}

