


class EducationModel {
  final String imageUrl;
  final String title;
  final String description;
  final String date;

  const EducationModel({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.date,
  });
}

List<EducationModel> educationData = const [
  EducationModel(
    imageUrl:
        'https://wastecontrolinc.com/wp-content/uploads/2022/09/wastecontrolinc.jpg',
    title: 'Waste Management',
    description:
        'Waste management or waste disposal includes the processes and actions required to manage waste from its inception to its final disposal.This includes the collection, transport, treatment and disposal of waste, together with monitoring and regulation of the waste management process and waste-related laws, technologies, economic mechanisms.',
    date: '16/02/2023',
  ),
  EducationModel(
    imageUrl:
    
        'https://cdn.britannica.com/02/141102-050-82CB8A59/Bulldozers-landfill.jpg',
    title: 'Solid-Waste Management',
    description:
        'solid-waste management, the collecting, treating, and disposing of solid material that is discarded because it has served its purpose or is no longer useful.',
    date: '03/06/2021',
  ),
  EducationModel(
    imageUrl:
        'https://industry.pulpandpaper-technology.com/articles/1504182590-top-methods-solid-waste-disposal-management.jpg',
    title: 'Incineration',
    description:
        'Incineration is a disposal method in which solid organic wastes are subjected to combustion so as to convert them into residue and gaseous products.',
    date: '05/01/2021',
  ),
  EducationModel(
    imageUrl:
        'https://www.investmentmonitor.ai/wp-content/uploads/sites/7/2022/02/nigeria-waste-management.jpg',
    title: 'Nigeria’s waste management sector opens up',
    description:
        'An agreement on sustainable plastic value chains in Nigeria, signed by Japan and the UN, is set to spur new business opportunities for the country.',
    date: '09/11/2022',
  ),
];
