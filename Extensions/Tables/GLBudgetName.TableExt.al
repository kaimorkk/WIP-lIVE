TableExtension 52193459 tableextension52193459 extends "G/L Budget Name" 
{
    fields
    {
        field(50000;"Department Filter";Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));
        }
        field(50001;"Total Budget Allocation";Decimal)
        {
            // CalcFormula = sum("Procurement Plan"."Estimated Cost" where ("Plan Year"=field(Name),
            //                                                              "Department Code"=field("Department Filter")));
            // FieldClass = FlowField;
        }
        field(50002;"Start Date";Date)
        {
        }
        field(50003;"End Date";Date)
        {
        }
        field(50004;"Budget Type";Option)
        {
            OptionCaption = 'Approved,Revised,Sublimentary';
            OptionMembers = Approved,Revised,Sublimentary;
        }
        field(50005;Select;Boolean)
        {
        }
        field(50006;Status;Option)
        {
            OptionCaption = 'New,Pending Approval,Approved,Rejected';
            OptionMembers = New,"Pending Approval",Approved,Rejected;
        }
        field(50007;"Department Filter 2";Code[20])
        {
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));
        }
    }
}

