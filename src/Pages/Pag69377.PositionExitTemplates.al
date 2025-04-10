page 69377 "Position Exit Templates"
{
    PageType = List;
    SourceTable = "Position Exit Templates";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                }
                field(PrimaryDirectorate; "Primary Directorate")
                {
                    ApplicationArea = Basic;
                }
                field(PrimaryDirectorateName; "Primary Directorate Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(PrimaryDepartment; "Primary Department")
                {
                    ApplicationArea = Basic;
                }
                field(PrimaryDepartmentName; "Primary Department Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ResponsibleEmployee; "Responsible Employee")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

