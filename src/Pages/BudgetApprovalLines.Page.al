Page 52193432 "Budget Approval Lines"
{
    ApplicationArea = Basic;
    CardPageID = "Budget Approval";
    PageType = List;
    SourceTable = "G/L Budget Name";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Name; Name)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(DepartmentFilter; "Department Filter")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(StartDate; "Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(EndDate; "End Date")
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

