

pageextension 50094 "pageextension50094" extends Qualifications
{
    layout
    {
        addafter(Description)
        {
            field("Qualification Category"; Rec."Qualification Category")
            {
                ApplicationArea = Basic;
            }
            field("Academic Hierachy Code"; Rec."Academic Hierachy Code")
            {
                ApplicationArea = Basic;
            }
            field("No. of Active Employees"; Rec."No. of Active Employees")
            {
                ApplicationArea = Basic;
            }
            field("No. of Qualified Applicants"; Rec."No. of Qualified Applicants")
            {
                ApplicationArea = Basic;
            }
            field(Blocked; Rec.Blocked)
            {
                ApplicationArea = Basic;
            }
        }
    }
}

#pragma implicitwith restore

