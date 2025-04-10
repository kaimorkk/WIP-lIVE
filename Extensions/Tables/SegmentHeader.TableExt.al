TableExtension 52193657 tableextension52193657 extends "Segment Header" 
{
    fields
    {
        field(50000;Time;Time)
        {
        }
        field(50001;Type;Option)
        {
            OptionMembers = "  ",StakeHolder,Media,"Event",Publication,"Customer Survey","Media Liason";
        }
        field(50002;"End Date";Date)
        {
        }
        field(50003;"Start Time";Time)
        {
        }
        field(50004;"End Time";Time)
        {
        }
        field(50005;"Venue Cide";Code[20])
        {
        }
        field(50006;Venue;Text[60])
        {
        }
        field(50007;"Event Status";Option)
        {
            OptionMembers = " ",Pending,Posponed,Canceled,Completed;
        }
        field(50008;Completed;Boolean)
        {
        }
        field(50009;Status;Option)
        {
            OptionMembers = Open,"Pending Approval",Canceled,Approved;
        }
        field(50010;"Implementing Agency No";Code[10])
        {
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                      if Vendor.Get("Implementing Agency No") then
                         "Implementing Agency Name":=Vendor.Name;
            end;
        }
        field(50011;"Implementing Agency Name";Text[80])
        {
        }
    }

    var
        Vendor: Record Vendor;
}

