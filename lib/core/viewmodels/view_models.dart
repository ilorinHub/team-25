import 'package:get_it/get_it.dart';
import 'package:machineglow/core/viewmodels/dashboard/upload_viewmodel.dart';
import 'package:machineglow/core/viewmodels/view_models.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

// exports
export 'theme/theme_view_model.dart';
export 'dashboard/dashboard_viewmodels.dart';
export 'auth/authviewmodel.dart';
export 'state_provider/state_provider.dart';

final glowProviders = <SingleChildWidget>[
  ChangeNotifierProvider<DashboardViewmodel>(
    create: (_) => GetIt.I<DashboardViewmodel>(),
  ),
  ChangeNotifierProvider<AuthViewModel>(
    create: (_) => GetIt.I<AuthViewModel>(),
  ),
  ChangeNotifierProvider<StateProvider>(
    create: (_) => GetIt.I<StateProvider>(),
  ),
  ChangeNotifierProvider<GlowThemeViewModel>(
    create: (_) => GetIt.I<GlowThemeViewModel>(),
  ),
  ChangeNotifierProvider<UploadScreenViewmodel>(
    create: (_) => GetIt.I<UploadScreenViewmodel>(),
  ),
];
