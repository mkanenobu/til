import Pic from "../public/kanagawa_oki_nami_ura.png";

const Image = ({
  title,
  className,
  containerClass,
}: {
  title: string;
  className: string;
  containerClass?: string;
}) => {
  return (
    <div className="">
      <p className="p-1">{title}</p>
      <div className={containerClass}>
        <img className={className} src={Pic} alt={title} />
      </div>
    </div>
  );
};

export const App = () => {
  return (
    <div className="min-h-svh max-w-[100vw] p-12">
      <div className="grid grid-cols-3 gap-4">
        <Image title="Opacity" className="transition hover:opacity-30" />
        <Image
          title="Opacity with color"
          className="transition hover:opacity-80"
          containerClass="hover:bg-blue-500"
        />
        <Image
          title="Monochrome to Color"
          className="transition grayscale hover:grayscale-0"
        />
        <Image
          title="Zoom in"
          className="transition hover:scale-150"
          containerClass="overflow-hidden"
        />
        <Image
          title="Zoom out"
          className="transition scale-150 hover:scale-100"
          containerClass="overflow-hidden"
        />
        <Image
          title="Rotation"
          className="transition rotate-45 hover:rotate-0"
          containerClass="overflow-hidden"
        />
        <Image
          title="Border"
          className="transition border-2 border-transparent hover:border-amber-300"
        />
        <Image title="Round" className="rounded-full hover:rounded-none" />
      </div>
    </div>
  );
};
