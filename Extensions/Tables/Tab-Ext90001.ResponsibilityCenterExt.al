tableextension 90001 "Responsibility Center Ext" extends "Responsibility Center"
{
    fields
    {
         field(80006; "Blocked?"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
         field(80000; "Operating Unit Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Approval Matrix,Directorate,Department,Division/Unit,County,Constituency,Branch,Board,Company-Level,CEO,Court Levels,Court Stations,Office,Authority,Ward,Org Unit';
            OptionMembers = " ",Directorate,"Department/Center","Division/Section",Region,Constituency,Branch,Board,"Company-Level",CEO,"Court Levels","Court Stations",Office,Authority,Ward,"Org Unit";
        }
        field(80001; "Direct Reports To"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
        field(80002; "Indirect Reports To"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
        field(80003; "Hierarchical  Level ID"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Level 1,Level 2,Level 3,Level 4,Level 5,Level 6,Level 7';
            OptionMembers = " ","Level 1","Level 2","Level 3","Level 4","Level 5","Level 6","Level 7";
        }
        field(80004; "Headed By (Title)"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Company Positions"."Position ID";
        }
        field(80005; "Current Head"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";
            trigger OnValidate()
            var
                Hremp: Record Employee;
            begin
                if Hremp.get("Current Head") then
                    "Current Head Name" := Hremp.FullName();
            end;
        }
        field(80012; "Current Head Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Description = 'SPM';
        }
    }
}
