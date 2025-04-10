 
   page 52194395 "Fleet Managment Role Center"
{
    Caption = 'Fleet Manamgent Role Center';
    PageType = RoleCenter;
    layout
    {
        area(rolecenter)
        {
            part("Fleet Management Cue"; "Fleet Management Cue")
            {
                Caption = 'Fleet Management Activities';
                ApplicationArea = Basic, Suite;
            }



            //  part(Document Approvals)

            systempart(Control1000000050; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1901420308; Outlook)
            {
                ApplicationArea = Basic;
            }

            part(Control21; "My Job Queue")
            {
                Visible = false;
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {
        area(Sections)
        {

            group("Group2")
            {
                Caption = 'Setup';
                action("FleetManagementSetup")
                {
                    ApplicationArea = Basic;
                    Caption = 'Fleet Management Setup';
                    RunObject = Page "Fleet Management Setup";
                    ToolTip = 'Executes the Fleet Management Setup action.';
                }

                action("Fleet Management Lookup")
                {
                    ApplicationArea = Basic;
                    Caption = 'Fleet Management Lookup';
                    RunObject = Page "Fleet Lookup";
                    ToolTip = 'Executes the Fleet Management Lookup page.';
                }

                action("Fleet Vehicle List")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Fleet Vehicle List';
                    Image = Allocate;
                    RunObject = page "Fleet Vehicles List";
                    ToolTip = 'Opens the Fleet Vehicle List Page.';

                }

                action("Vehicle Model List")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Vehicle Model List';
                    Image = Allocate;
                    RunObject = page "Vehicle Model List";
                    ToolTip = 'Opens the Vehicle Model List Page.';
                }
                action("Vehicle Make List")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Vehicle Make List';
                    Image = Allocate;
                    RunObject = page "Vehicle Make List";
                    ToolTip = 'Opens the Vehicle Make List Page.';
                }
                action("Vehicle Types")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Vehicle Types';
                    Image = Allocate;
                    RunObject = page "Vehicle Types";
                    ToolTip = 'Opens the Vehicle Types List Page.';

                }
                action("Vehicle Tire Sizes")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Vehicle Tire Sizes';
                    Visible=false;
                    // RunObject = page "Vehicle Tyre Size";
                    ToolTip = 'Opens the Vehicle Tire Sizes List Page.';

                }
            }

            group(VehicleReq)
            {
                Caption = 'Vehicle Requisition Management';

                action("Fleet Vehicles")
                {
                    ApplicationArea = Basic;
                    Caption = 'Fleet Vehicles';
                    Image = Employee;
                    RunObject = Page "Fleet Vehicles List";
                    ToolTip = 'Executes the Fleet Vehicles action.';
                }
                action("Fleet Drivers")
                {
                    ApplicationArea = Basic;
                    Caption = 'Fleet Drivers';
                    Image = Employee;
                    RunObject = Page "Fleet Drivers List";
                    ToolTip = 'Executes the Fleet Drivers action.';
                }
                action("Requisition List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transport Requisition List';
                    Image = Employee;
                    RunObject = page "Fleet Requisition List";
                    ToolTip = 'Executes the Approved Work Tickets action.';
                }
                action("Pending Fleet Requests")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transport Requests Pending Approval';
                    Image = Employee;
                    RunObject = page "Pending Fleet Requests list";
                    ToolTip = 'Executes the Approved Work Tickets action.';
                }
                action("Approved Fleet Requests")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Transport Requests';
                    Image = Employee;
                    RunObject = Page "Approved Fleet Requests List";
                    ToolTip = 'Executes the Approved Fleet Requests action.';
                }

                action("DriversInactive")
                {
                    ApplicationArea = Basic;
                    Caption = 'Inactive Drivers';
                    Image = Employee;
                    RunObject = page "Fleet Drivers List";
                    RunPageView = where(Active = const(true));
                    ToolTip = 'Executes the Approved Work Tickets action.';
                }
                action("Fleet Requisition Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Fleet Requisition Report';
                    Image = Report2;
                    RunObject = report "Fleet Requisition Report";
                    ToolTip = 'Executes the Approved Work Tickets action.';
                }
                action("Closed Fleet Requests")
                {
                    ApplicationArea = Basic;
                    Caption = 'Closed Transport Requests';
                    Image = Camera;
                    RunObject = page "Closed Fleet Requests List";
                    RunPageView = where(Status = filter(Closed), "Handover Type" = filter(Requisitioned));
                    ToolTip = 'Executes the Approved Work Tickets action.';
                }
                action("Handed Fleet Requests")
                {
                    ApplicationArea = Basic;
                    Caption = 'Handed Over Vehicles';
                    RunObject = page "Closed Fleet Requests List";
                    RunPageView = where(Status = filter("Handed Over"), "Handover Type" = filter(Requisitioned));
                    ToolTip = 'Executes the Approved Work Tickets action.';
                }
                action("Handovers")
                {
                    ApplicationArea = Basic;
                    Caption = 'Handover List';
                       Visible=false;
                    // RunObject = page "Non Requisitioned Handovers";
                    // RunPageView = where("Handover Type" = filter(NonRequisitioned));
                }
            }

            group("Work Ticket")
            {
                Caption = 'Work Ticket Management';
                action("Work Tickets")
                {
                    ApplicationArea = Basic;
                    Caption = 'Work Tickets';
                    Image = Employee;
                    RunObject = Page "Daily Work Ticket List";
                    ToolTip = 'Executes the Approved Work Tickets action.';
                }
                action("Approved Work Tickets")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Work Tickets';
                    Image = Employee;
                    RunObject = Page "Approved Daily Work Ticket Lis";
                    ToolTip = 'Executes the Approved Work Tickets action.';
                }
                action("Closed Work Tickets")
                {
                    ApplicationArea = Basic;
                    Caption = 'Closed Work Tickets';
                    Image = Employee;
                    RunObject = Page "Closed Daily Work Ticket";
                    ToolTip = 'Executes the Approved Work Tickets action.';
                }
            }

            group("Tyre Requisition")
            {
                action("Tyre Requisition List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Tyre Requisition';
                    Image = Lock;
                    RunObject = Page "Tyre Requisition List";
                    ToolTip = 'Executes the Tyre Requisitions page.';
                }


                action("Posted Tyre Requisition")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Tyre Requisition';
                    Image = Lock;
                    RunObject = Page "Posted Tyre Requisition List";
                    ToolTip = 'Executes the Posted Tyre Requisitions page.';
                }
                action("Issued Tyre Requests")
                {
                    ApplicationArea = Basic;
                    Caption = 'Issued Tyre Requests';
                    Image = Lock;
                    RunObject = Page "Posted Tyre Requisition List";
                    ToolTip = 'Executes the Issued Tyre Requisitions page.';
                }



            }

            group("VehicleMaint")
            {
                Caption = 'Vehicle Maintenance';
                action("Maintenance Requests")
                {
                    ApplicationArea = Basic;
                    Caption = 'Maintenance Requests';
                    Image = Employee;
                    RunObject = Page "Maintenance Requests list";
                    ToolTip = 'Executes the Approved Work Tickets action.';
                }
                action("Pending Maintenance Requests")
                {
                    ApplicationArea = Basic;
                    Caption = 'Pending Maintenance Requests';
                    Image = Employee;
                    RunObject = Page "Pending Maintenance Requests";
                    ToolTip = 'Executes the Approved Work Tickets action.';
                }
                action("Approved Maintenance Requests")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Maintenance Requests';
                    Image = Employee;
                    RunObject = Page "Approved Maintenance Requests";
                    ToolTip = 'Executes the Approved Work Tickets action.';
                }
                action("Finalized Maintenance Requests")
                {
                    ApplicationArea = Basic;
                    Caption = 'Finalized Maintenance Requests';
                    Image = Employee;
                    Visible=false;
                    // RunObject = Page "Finalized Maintenance Requests";
                    ToolTip = 'Executes the Approved Work Tickets action.';
                }
                action("Maintenance Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Maintenance Report';
                    Image = Report2;
                    RunObject = report "Fuel and Maintenance Report";
                    ToolTip = 'Executes the Approved Work Tickets action.';
                }
            }

            group("Fuel Request")
            {
                action("Fuel Requests List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Fuel Requests List';
                    Image = List;
                    RunObject = Page "Fuel Requests List";
                }

                action("Pending Fuel Requests")
                {
                    ApplicationArea = Basic;
                    Caption = 'Pending Fuel Reqeusts';
                    Image = List;
                    RunObject = Page "Pending Fuel Requests";
                }
                action("Approved Fuel Requests")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Fuel Reqeusts';
                    Image = List;
                    RunObject = Page "Approved Fuel Requests";
                }
                action("Closed Fuel Requests")
                {
                    ApplicationArea = Basic;
                    Caption = 'Closed Fuel Reqeusts';
                    Image = List;
                    RunObject = Page "Closed Fuel Requests";
                }

            }

            group("Vehicle Request")
            {
                action("Vehicle Request List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Motor Vehicle Request List';
                    Image = Employee;
                    RunObject = Page "Vehicle Request List";
                    ToolTip = 'Executes the Vehicle Request List page.';
                }
                action("Approved Vehicle Request List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Motor Vehicle Allocation Request';
                    Image = Employee;
                       Visible=false;
                    // RunObject = Page "Approved Vehicle Request List";
                    ToolTip = 'Executes the Approved Vehicle Request List page.';
                }
            }

            group("Vehicle Incident")
            {
                action("Vehicle Incident List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vehicle Incidence List';
                    Image = Employee;
                    RunObject = Page "Vehicle Incident List";
                    ToolTip = 'Executes the Vehicle Incident List action.';
                }
                action("Submitted Vehicle Incident List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Submitted Vehicle Incident List';
                    Image = Employee;
                       Visible=false;
                    // RunObject = Page "Submitted Vehicle Incidents";
                    ToolTip = 'Executes the Submitted Vehicle Incident List action.';
                }
                action("Approved Vehicle Incident List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Vehicle Incidence List';
                    Image = Employee;
                       Visible=false;
                    // RunObject = Page "Approved Vehicle Incident List";
                    ToolTip = 'Executes the Approved Vehicle Incident List action.';
                }


            }

            group("Insurance Management")
            {
                Caption = 'Fleet Insurance Management';
                Visible = false;
                action("Insurance")
                {
                    ApplicationArea = Basic;
                    Caption = 'Insurance Types';
                    Image = Employee;
                    RunObject = Page "Insurance Types";
                    ToolTip = 'Executes the Approved Work Tickets action.';
                }
                action("Vehicle Insurance")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vehicle Insurance List';
                    Image = Employee;
                    RunObject = Page "Vehicle Insurance List";
                    ToolTip = 'Executes the Approved Work Tickets action.';
                }
                action("Vehicle Insurance Due")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vehicle Insurance Due Expiry';
                    Image = Employee;
                    RunObject = Page "Vehicle Insurance Due Expiry";
                    ToolTip = 'Executes the Approved Work Tickets action.';
                }
                action("Expired Vehicle Insurance")
                {
                    ApplicationArea = Basic;
                    Caption = 'Expired Vehicle Insurance';
                    Image = Employee;
                    RunObject = Page "Expired Vehicle Insurance";
                    ToolTip = 'Executes the Approved Work Tickets action.';
                }
                action("Insurance Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Fleet Vehicle Insurance Report';
                    Image = Report2;
                    RunObject = report "Fleet Vehicle Insurance Report";
                    ToolTip = 'Executes the Approved Work Tickets action.';
                }
                action("Blocked Vehicle Insurance")
                {
                    ApplicationArea = Basic;
                    Caption = 'Blocked Vehicle Insurance';
                    Image = Employee;
                    RunObject = Page "Blocked Vehicle Insurance";
                    ToolTip = 'Executes the Approved Work Tickets action.';
                }
            }
            group("Fuel")
            {
                Caption = 'Fuel Management';
                action("Fuel Card List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Fuel List';
                    Image = Employee;
                    RunObject = Page "Fuel Card List";
                    ToolTip = 'Executes the Fuel Card List Action.';
                    //Fuel Card List-closed
                }
                action("Fuel Card List Closed")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Fuel List';
                    Image = Employee;
                    RunObject = Page "Fuel Card List-closed";
                    ToolTip = 'Executes the Closed Fuel Card List';
                }
                /* action("Pending Fuel Requests")
                {
                    ApplicationArea = Basic;
                    Caption = 'Pending Fuel Requests';
                    Image = Employee;
                    RunObject = Page "Pending Fuel Requests";
                    ToolTip = 'Executes the Approved Work Tickets action.';
                }
                action("Approved Fuel Requests")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Fuel Requests';
                    Image = Employee;
                    RunObject = Page "Approved Fuel Requests";
                    ToolTip = 'Executes the Approved Work Tickets action.';
                }
                action("Closed Fuel Requests")
                {
                    ApplicationArea = Basic;
                    Caption = 'Closed Fuel Requests';
                    Image = Employee;
                    RunObject = Page "Closed Fleet Requests List";
                    ToolTip = 'Executes the Approved Work Tickets action.';
                }
 */
                action("Fuel  Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Fuel  Report';
                    Image = Report2;
                    RunObject = report "Fuel and Maintenance Report";
                    ToolTip = 'Executes the Approved Work Tickets action.';
                }
            }
            group("Fleet Report")
            {
                Caption = 'Fleet Reports';
                action(Drivers)
                {
                    ApplicationArea = all;
                    Caption = 'Fleet Drivers Report';
                    Image = Employee;
                    RunObject = report Drivers;
                    ToolTip = 'Report of all drivers';
                }
                action("Vehicles List Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vehicles List  Report';
                    Image = Report2;
                    RunObject = report "Fleet Vehicles List";
                    ToolTip = 'Executes the Approved Work Tickets action.';
                }
                action("Vehicles Assignment Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vehicles Assignment Report';
                    Image = Report2;
                    RunObject = report "Vehicles Assignment Per Driver";
                    ToolTip = 'Executes the Approved Work Tickets action.';
                }
                action("Fleet RequisitionReport")
                {
                    ApplicationArea = Basic;
                    Caption = 'Fleet Requisition Report';
                    Image = Report2;
                    RunObject = report "Fleet Requisition Report";
                    ToolTip = 'Executes the Approved Work Tickets action.';
                }
            }
        }
    }
}
profile "Fleet Managment Role Center"
{
    Caption = 'Fleet Managment Role Center';
    RoleCenter = "Fleet Managment Role Center";
    ProfileDescription = 'Fleet Managment Role Center';
}

